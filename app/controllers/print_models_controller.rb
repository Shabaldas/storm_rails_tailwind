class PrintModelsController < ApplicationController
  def new
    @print_model = PrintModel.new
    @print_model.print_model_attributes.build
  end

  def manage
    @print_model = PrintModel.find_or_initialize_by(id: print_model_params[:id])

    if @print_model.persisted? && @print_model.name == print_model_params[:file].original_filename
      @print_model.assign_attributes(print_model_params.except(:file))
    else
      @print_model.assign_attributes(print_model_params)
      @print_model.name = print_model_params[:file].original_filename
    end

    @print_model.save

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('print_model_id_field', partial: 'form')
      end
    end
  end

  private
  def print_model_params
    params.require(:print_model).permit(:id, :file, :size, :weight, :volume, print_model_attributes_attributes: %i[material quality color subtotal_price])
  end
end

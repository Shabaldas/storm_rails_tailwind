class StaticPagesController < ApplicationController
  def home
    @call_question = CallQuestion.new
  end

  def modeling; end

  def rendering; end

  def print; end

  def save_phone_number
    @call_question = CallQuestion.new(call_question_params)
    respond_to do |format|
      format.turbo_stream do
        unless @call_question.save
          render turbo_stream: turbo_stream.update('print_model_id_field', partial: 'question_form')
        end
      end
    end
  end

  private

  def call_question_params
    params.require(:call_question).permit(:phone_number)
  end
end

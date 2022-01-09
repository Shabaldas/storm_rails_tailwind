ActiveAdmin.register ProductOption do
  menu false

  permit_params product_option_values_attributes: %i[id option_value_id price _destroy]

  form partial: 'admin/product_options/form'

  controller do
    def update
      update! do |format|
        if @product_option.errors.any?
          format.html { render :edit }
        else
          format.html { redirect_to admin_product_path(@product_option.product) }
        end
      end
    end
  end
end

ActiveAdmin.register Product do
  permit_params :name, :description, :status,
                :category_id, :product_type, :price,
                :main_picture, related_product_ids: [], files: [],
                product_options_attributes: [:id, :option_id, :primary, :_destroy]  # rubocop:disable  Layout/HashAlignment

  form partial: 'admin/products/form'

  index do
    selectable_column
    column :id
    column :name
    column :slug
    column 'Price' do |product|
      number_to_uah(product.price) if product.own_price?
    end
    column :product_type
    column('Category') { |product| product.category&.name }
    column :main_picture do |product|
      image_tag product.main_picture.variant(resize: '100x100') if product.main_picture.present?
    end

    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row(:description) { |product| sanitize product.description }
      row('Category') { |product| product.category&.name }
      row :product_type
      if product.own_price?
        row 'Price' do |product|
          number_to_uah(product.price)
        end
      end
      row :picture do |product|
        image_tag product.main_picture, height: '250' if product.main_picture.present?
      end

      row :created_at
      row :updated_at
    end

    if product.option_price?
      panel 'Table of Options' do
        table_for product.product_options do
          column :id
          column 'Title' do |option|
            link_to option.title.humanize, admin_option_path(option)
          end
          column :primary
          column 'Value' do |product_option|
            product.product_option_values.joins(:product_option)
                   .where(product_options: { id: product_option.id }).each do |pov|
              li "#{pov.value}#{pov.measurement} - #{number_to_uah(pov.price)}"
            end
            nil
          end
          column 'Actions' do |option|
            link_to 'Manage value', edit_admin_product_option_path(option)
          end
        end
      end
    end
    panel (t('global.admin.product') + link_to(t('global.admin.add_product'), add_related_products_admin_product_path(product),
                                               class: 'right panel_header_action')).html_safe do
      table_for product.related_products do
        column :id
        column :name
      end
    end
  end

  member_action :edit_option_values, method: :get do
    @option_values = OptionValue.where(option_id: params[:option_id])
  end

  member_action :add_related_products, method: :get

  member_action :update_option_values, method: :put do
    product_option = resource.product_options.find_by(option_id: params[:option_id])
    current_option_value_ids =
      Option.find_by(id: params[:option_id]).option_values.map { |i| i.id.to_s }
    option_value_ids = params.dig(:product, :option_value_ids).compact_blank
    option_values_for_delete = current_option_value_ids - option_value_ids
    product_value_ids = resource.option_values.map { |i| i.id.to_s }

    option_value_ids.each do |ov_id|
      next if product_value_ids.include?(ov_id)

      product_option.product_option_values.create(option_value_id: ov_id)
    end

    resource.product_option_values.where(option_value_id: option_values_for_delete).destroy_all

    redirect_to admin_product_path(resource)
  end

  controller do
    def find_resource
      finder = resource_class.is_a?(FriendlyId) ? :slug : :id
      scoped_collection.find_by(finder => params[:id])
    end
  end
end

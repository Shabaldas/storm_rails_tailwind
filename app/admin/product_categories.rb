ActiveAdmin.register ProductCategory do
  permit_params :name, :parent_id

  form partial: 'admin/product_categories/form'

  index do
    selectable_column
    column :name
    column :slug
    column :created_at
    column :updated_at
    column('Parent') { |item| item.parent&.name }
    column('Root') { |item| item.is_root? ? nil : item.root&.name }

    actions
  end

  controller do
    def find_resource
      finder = resource_class.is_a?(FriendlyId) ? :slug : :id
      scoped_collection.find_by(finder => params[:id])
    end
  end
end

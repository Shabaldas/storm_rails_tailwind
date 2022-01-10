ActiveAdmin.register Option do
  permit_params  :title, :slug, :option_type,
                 :measurement,
                 option_values_attributes: [:id, :value, :_destroy]

  form partial: 'admin/options/form'

  show do |option|
    attributes_table do
      row :title
      row :slug
      row :option_type
      row :measurement
    end
    panel 'Table of Values' do
      table_for option.option_values do
        column :id
        column :value
      end
    end
  end
end

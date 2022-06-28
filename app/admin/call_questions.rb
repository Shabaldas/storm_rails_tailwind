ActiveAdmin.register CallQuestion do
  permit_params :phone_number, :checked

  index do
    selectable_column
    column :id
    column :phone_number
    column :checked
    column :created_at

    actions
  end
end

ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :email,
                :password,
                :password_confirmation,
                :first_name,
                :last_name

  filter :email
  filter :first_name
  filter :last_name

  index do
    selectable_column
    column :email
    column :first_name
    column :last_name
    actions
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :date_of_birth
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def update_resource(object, attributes)
      update_method = if attributes.first[:password].present?
                        :update_attributes
                      else
                        :update_without_password
                      end
      object.send(update_method, *attributes)
    end
  end
end

# app/admin/admin_users.rb

ActiveAdmin.register AdminUser do
  # Disable default filters (Ransack) to avoid errors on reset_password_token fields.
  config.filters = false

  permit_params :email, :password, :password_confirmation

  # Custom index page: no id_column or default actions, no pagination.
  index pagination: false do
    selectable_column
    column :id
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column "Actions" do |user|
      span link_to("Edit", "/admin/admin_users/#{user.id}/edit")
      span link_to("Delete", "/admin/admin_users/#{user.id}", method: :delete, data: { confirm: "Are you sure?" })
    end
  end

  # Form for creating and editing admin users.
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

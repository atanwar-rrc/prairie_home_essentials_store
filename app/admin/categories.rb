# app/admin/categories.rb
ActiveAdmin.register Category do
  permit_params :name

  index pagination: false do
    selectable_column
    column :id
    column :name
    column :created_at
    column :updated_at
    column "Actions" do |category|
      span link_to("Edit", "/admin/categories/#{category.id}/edit")
      span link_to("Delete", "/admin/categories/#{category.id}",
                   method: :delete,
                   data: { confirm: "Are you sure?" })
    end
  end

  # filters, form and show block can remain unchanged
end

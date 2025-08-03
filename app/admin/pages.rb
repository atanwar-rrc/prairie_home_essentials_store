# app/admin/pages.rb
ActiveAdmin.register Page do
  permit_params :slug, :title, :body

  index pagination: false do
    selectable_column
    column :id
    column :slug
    column :title
    column :updated_at
    column "Actions" do |page|
      span link_to("Edit", "/admin/pages/#{page.id}/edit")
      span link_to("Delete", "/admin/pages/#{page.id}",
                   method: :delete,
                   data: { confirm: "Are you sure?" })
    end
  end

  # filters and form remain the same
end

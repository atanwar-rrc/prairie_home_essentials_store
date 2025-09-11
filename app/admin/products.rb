# app/admin/products.rb

ActiveAdmin.register Product do
  # Disable default filters (Ransack) to avoid errors.
  config.filters = false

  # Permit attributes for creation/updating, including image_url.
  permit_params :name, :description, :price, :stock, :image_url, category_ids: []

  # Custom index: no id_column, no pagination.
  index pagination: false do
    selectable_column
    column :id
    column :name
    column :description
    column :price
    column :stock
    column :image_url do |product|
      product.image_url.presence || "None"
    end
    column :categories do |product|
      product.categories.map(&:name).join(', ').presence || "No categories"
    end
    column "Actions" do |product|
      span link_to("Edit", "/admin/products/#{product.id}/edit")
      span link_to("Delete", "/admin/products/#{product.id}",
                   method: :delete,
                   data: { confirm: "Are you sure?" })
    end
  end

  # Form for creating/editing products (use Image URL instead of file upload).
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock
      f.input :image_url, label: "Image URL"
      f.input :categories, as: :check_boxes, collection: Category.all
    end
    f.actions
  end

  # Show page: display the image if a URL is provided.
  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :price
      row :stock
      row :image_url do |product|
        if product.image_url.present?
          image_tag product.image_url, style: "max-height: 200px; max-width: 200px;"
        else
          "No image provided"
        end
      end
      row :categories do |product|
        product.categories.map(&:name).join(', ')
      end
      row :created_at
      row :updated_at
    end
  end
end

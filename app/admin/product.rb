ActiveAdmin.register Product do
  config.per_page = 10
  remove_filter :feature_values, :order_products
  permit_params :name, :description, :price, :product, :category_id

  batch_action :destroy do |products|
    redirect_to admin_products_path, alert: "Didn't really delete these!"
  end

  index do |products|
    selectable_column
    column 'Image' do |product|
      link_to image_tag(image_url("50x30/#{rand(4)}.jpg")), admin_product_path(product)
    end
    column 'Category', :category do |product|
      product.category.name if product.category.name
    end
    column 'name of item product', :name
    column 'describe of product', :description
    column :price, sortable: :price do |product|
      div class: 'price' do
        number_to_currency product.price, unit: 'грн.', format: '%n %u', separator: ','
      end
    end
    column 'Date of creation', :created_at
    actions
  end
end

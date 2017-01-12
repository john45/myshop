ActiveAdmin.register Product do
  remove_filter :feature_values, :order_products
  permit_params :name, :description, :price, :product, :category_id



  index do
    column 'Category', :category do |product|
      if product.category.name
        product.category.name
      end
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

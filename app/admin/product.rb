ActiveAdmin.register Product do

  remove_filter :feature_values, :order_products
  permit_params :name, :description, :price, :product, :category_id


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

  index do
    column 'Category', :category do |product|
      if product.category.name
        product.category.name
      end
    end
    column 'name of item product', :name
    column 'describe of product', :description
    column :price, sorable: :price do |product|
      div class: 'price' do
        number_to_currency product.price
      end
    end
    column 'Date of creation', :created_at
    actions
  end


end

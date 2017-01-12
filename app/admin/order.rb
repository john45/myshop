ActiveAdmin.register Order do
  config.per_page = 10
  remove_filter :order_products
  permit_params :phone, :name, :email, :status
  scope :start
  scope :in_progress
  scope :finish

  index do |orders|
    column 'Image' do |order|
      link_to image_tag(image_url("http://lorempixel.com/50/30/#{['technics',
                                                                  'transport',
                                                                  'business',
                                                                  'city',
                                                                  'nature'].sample}")),
              admin_order_path(order)
    end
    column :name
    column :email
    column :phone
    column :created_at
    column :status
    column 'Total sum' do |order|
      order.total_price_order
    end
    column 'Quantity' do |order|
      order.quantity
    end
    actions
  end

  show do |order|
    attributes_table do
      row :name
    end
    table_for(order.order_products) do
      column :quantity
      column 'Title' do |i|
        link_to i.product.name, admin_product_path(i.product)
      end
    end
  end

  form do |order|
    inputs 'Details' do
      input :email
      input :name
      input :phone
      input :created_at, label: "When was ordered"
    end
    panel 'Status' do
      select :status, Order::STATUSES
    end
    para "Press cancel to return to the list without saving." do
    end
    actions
  end
end

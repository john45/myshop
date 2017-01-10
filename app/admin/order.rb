ActiveAdmin.register Order do
  remove_filter :order_products
  permit_params :phone, :name, :email, :status
  scope :unprocessored
end

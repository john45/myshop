ActiveAdmin.register Order do
  remove_filter :order_products
  permit_params :phone, :name, :email, :status
  scope :unprocessored

  # show do
  #   h3 order.id
  #   div do
  #     simple_format order.name
  #   end
  #   order.email
  #   strong order.status
  #   strong order.order_products
  # end
  
  ActiveAdmin.register OrderProduct do
    belongs_to :order
  end
end

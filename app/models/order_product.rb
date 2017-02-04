# == Schema Information
#
# Table name: order_products
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  product_id   :integer
#  actual_price :decimal(8, 2)    default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cart_id      :integer
#  quantity     :integer          default(1)
#

class OrderProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :order

  def total_price
    product.price * quantity
  end
end

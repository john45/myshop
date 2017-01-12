# == Schema Information
#
# Table name: order_products
#
#  order_id     :integer
#  product_id   :integer
#  actual_price :decimal(8, 2)    default(0.0)
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  id           :integer          not null, primary key
#  cart_id      :integer
#

class OrderProduct < ApplicationRecord
    belongs_to :cart
    belongs_to :product
    belongs_to :order

  def total_price
    product.price * quantity
  end


end

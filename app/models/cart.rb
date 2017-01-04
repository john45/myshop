# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :order_products, dependent: :destroy

  def add_product(product_id)
    current_item = order_products.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_products.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    order_products.to_a.sum { |item| item.total_price}
  end
end

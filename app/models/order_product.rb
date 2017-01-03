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
#

class OrderProduct < ApplicationRecord
    belongs_to :product
    belongs_to :order
end

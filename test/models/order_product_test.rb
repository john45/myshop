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

require 'test_helper'

class OrderProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

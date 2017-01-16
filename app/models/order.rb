# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  phone      :string
#  name       :string
#  email      :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  enum status: { start: 'start', in_progress: 'in progress', finish: 'finish'}
  STATUSES = ['start', 'in progress', 'finish']
  scope :unprocessored, -> { where(status: 'start') }
  has_many :order_products, dependent: :destroy
  validates :name, :email, :phone, presence: true

  def add_order_product_from_cart(cart)
    cart.order_products.each do |item|
       item.cart_id = nil
       order_products << item
    end
  end

  def total_price_order
    order_products.to_a.sum { |item| item.total_price}
  end

  def quantity
    order_products.to_a.sum { |item| item.quantity }
  end
end

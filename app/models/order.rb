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
    has_many :order_products
    has_many :products, through: :order_products
    
    validates :name, :email, :phone, presence: true
end

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(8, 2)    default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Product < ApplicationRecord
  has_many :related_products
  has_many :reviews
  has_many :feature_values
  has_many :features, through: :feature_values
  has_many :order_products
  has_many :orders, through: :order_products
  belongs_to :category
end

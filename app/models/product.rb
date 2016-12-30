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
  belongs_to :category
  scope :undescribe, -> { where(description: nil) }
end

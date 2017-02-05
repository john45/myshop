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
#  price_old   :decimal(8, 2)    default(0.0)
#  immage      :string
#

FactoryGirl.define do
  factory :product do
    name "some test product"
    description "some description"
    price 1.23
    price_old 0.23
    immage '1.jpg'
    category_id 2
  end
end

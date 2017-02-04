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
#

FactoryGirl.define do
  factory :product do
  end
end

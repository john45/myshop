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

require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'testin validation model product' do
    it "name les than 3 char" do
      product = Product.create(name: 'qw', description: 'wqw', price: 11.2, category_id: 23)
      expect(product).not_to be_valid
    end

    it "name more than 3 char" do
      product = Product.create(name: 'qwe', description: 'wqw', price: 11.2, category_id: 23)
      expect(product).to be_valid
    end
  end
end

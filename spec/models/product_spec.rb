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

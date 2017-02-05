require 'rails_helper'

describe 'Regular user behavior' do
  let(:product) { create(:product) }

  it 'must see My Store in header when go to root' do
    visit root_path
    expect(page).to have_content 'My Store'
  end

  it 'going to some product show and see all information' do
    visit product_url(product)
    expect(page).to have_content 'description'
    expect(page).to have_content 'specifications'
    expect(page).to have_content 'Leave a Review'
    expect(page).to have_content product.name
  end
end
# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  author     :string
#  product_id :integer
#  body       :text
#  rating     :integer
#  email      :string
#  published  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

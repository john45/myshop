# == Schema Information
#
# Table name: related_products
#
#  id            :integer          not null, primary key
#  product_id    :binary
#  assotiated_id :binary
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class RelatedProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

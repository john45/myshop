# == Schema Information
#
# Table name: feature_values
#
#  title      :string
#  feature_id :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :integer          not null, primary key
#

class FeatureValue < ApplicationRecord
  belongs_to :product
  belongs_to :feature
end

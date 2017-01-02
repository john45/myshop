# == Schema Information
#
# Table name: features
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feature < ApplicationRecord
  has_many :feature_values
  has_many :products, through: :feature_values
end

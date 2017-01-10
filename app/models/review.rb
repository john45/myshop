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

class Review < ApplicationRecord
  belongs_to :product
  scope :list_of_published_only, -> { where(published: true).order(created_at: 'DESC') }
  scope :not_published, -> { where(published: false) }
  RATING = [1, 2, 3, 4, 5]
end

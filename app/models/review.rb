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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  published  :boolean          default(FALSE)
#

class Review < ApplicationRecord
  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :author, :product_id, :body, :rating, :email, presence: true
  validates :email, format: VALID_EMAIL_FORMAT
  belongs_to :product
  scope :list_of_published_only, -> { where(published: true).order(created_at: 'DESC') }
  scope :not_published, -> { where(published: false) }
  RATING = [1, 2, 3, 4, 5].freeze
end

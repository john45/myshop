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

class RelatedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :assotiated, class_name: 'Product', foreign_key: 'assotiated_id'
end

class RelatedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :assotiated, class_name: 'Product', foreign_key: 'assotiated_id'
end

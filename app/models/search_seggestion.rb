class SearchSeggestion < ApplicationRecord
  def self.term_for(prefix)
    seggestion = where("term ILIKE ?", "#{prefix}_%")
    seggestion.order('popularity desc').limit(10).pluck(:term)
  end

  def self.index_products
    Product.find_each do |product|
      index_term(product.name)
      product.name.split.each { |x| index_term(x) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_create.tap do |seggestion|
      seggestion.increment! :popularity
    end
  end
end

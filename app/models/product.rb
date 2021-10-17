# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :variants
  accepts_nested_attributes_for :variants

  def self.not_loaded_product
    Product.left_outer_joins(:variants).where("products.name= ' '
        IS NOT FALSE OR products.description = ' ' IS NOT FALSE OR variants.name= ' ' IS NOT
        FALSE  OR variants.precio= ' ' IS NOT FALSE").count
  end

  def self.loaded_product
    Product.joins(:variants).where("products.name IS NOT null and
        products.description  IS NOT null and variants.name IS NOT
        null  and variants.precio IS NOT null").count
  end
end

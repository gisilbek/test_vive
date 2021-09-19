class Product < ApplicationRecord
  has_many :variants
  accepts_nested_attributes_for :variants
end

class ProductSerializer < ActiveModel::Serializer
  attributes :name, :description
  has_many :variants
end
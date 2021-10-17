class VariantSerializer < ActiveModel::Serializer
  attributes :name, :precio
  def product
    object.product
  end
end

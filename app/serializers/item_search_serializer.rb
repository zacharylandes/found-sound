class ItemSearchSerializer < ActiveModel::Serializer
  attributes :type, :q, :results

  has_many :results, serializer: ItemSerializer
end

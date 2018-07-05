class CategorySerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :name
  has_many :subjects
end

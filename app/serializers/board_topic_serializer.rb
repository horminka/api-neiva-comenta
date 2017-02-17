class BoardTopicSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :description
  has_many :topics
end

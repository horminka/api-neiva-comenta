class BoardSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :description
end

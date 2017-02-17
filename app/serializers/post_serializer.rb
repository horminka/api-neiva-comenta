class PostSerializer < ActiveModel::Serializer
  attributes :id,
    :content,
    :image,
    :created_at

  def created_at
    object.created_at.to_formatted_s(:iso8601)
  end
end

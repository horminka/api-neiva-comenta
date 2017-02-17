class TopicSerializer < ActiveModel::Serializer
  attributes :id,
    :title,
    :content,
    :image,
    :created_at

  has_many :last_posts

  def created_at
    object.created_at.to_formatted_s(:iso8601)
  end

end

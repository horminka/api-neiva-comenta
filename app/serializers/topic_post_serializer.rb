class TopicPostSerializer < ActiveModel::Serializer
  attributes :id,
    :title,
    :content,
    :image,
    :created_at,
    :board_id,
    :board_name,
    :board_description

  has_many :posts

  def created_at
    object.created_at.to_formatted_s(:iso8601)
  end

  def board_name
    object.board.name
  end

  def board_description
    object.board.description
  end
end

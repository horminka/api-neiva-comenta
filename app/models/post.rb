class Post < ActiveRecord::Base
  belongs_to :topic

  validates_presence_of :content, :topic
  validates :content, length: { maximum: 1200 }
  validates :image, length: { maximum: 200 }
end

class Topic < ActiveRecord::Base
  validates_presence_of :title, :content, :image, :board
  validates :title, length: { maximum: 100 }
  validates :content, length: { maximum: 1200 }
  validates :image, length: { maximum: 200 }

  belongs_to :board
  has_many :posts, -> { order('id ASC') }
  has_many :last_posts, -> { order('id ASC').limit(3) }, class_name: 'Post'
end

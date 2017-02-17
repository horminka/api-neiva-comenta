class Board < ActiveRecord::Base
  validates_presence_of :name, :description

  has_many :topics
end

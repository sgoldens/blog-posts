class Post < ApplicationRecord
  belongs_to :user
  has_many :tags

  validates :title, :presence => true
  validates :content, :presence => true
  validates :user_id, :presence => true
end

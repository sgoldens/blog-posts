class Post < ApplicationRecord
  belongs_to :user
  has_many :tags

  validates :title, :presence => true
  validates :title, :uniqueness => true
  validates :categories, :presence => true
  validates :content, :presence => true
  validates :content, :uniqueness => true
  validates :user_id, :presence => true
end

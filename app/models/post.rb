class Post < ActiveRecord::Base
  include VoteableJeff1
  include SluggableJeff1
  
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  # because foreign key is user_id we have to be explicit and say foreign key is user_id b/c we're
  # deviating from convention
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories


  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true

  sluggable_column :title
end
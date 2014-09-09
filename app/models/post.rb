class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  # because foreign key is user_id we have to be explicit and say foreign key is user_id b/c we're
  # deviating from convention
  has_many :comments
end
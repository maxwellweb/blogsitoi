class Post < ActiveRecord::Base
  permalink :title
	validates_presence_of :body, :title
	has_many :comments
end

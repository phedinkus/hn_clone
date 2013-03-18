class User < ActiveRecord::Base
	has_many :posts

	validates :username, presence: true, uniqueness: {case_sensitive: false}
	# accepts_nested_attributes_for :posts
end

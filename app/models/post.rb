class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :url, presence: true, format: URI::regexp(%w(http https))
	validates :title, presence: true
	validates :user, associated: true, presence: true
end

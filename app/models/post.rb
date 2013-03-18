class Post < ActiveRecord::Base
	belongs_to :user

	validates :url, presence: true, format: URI::regexp(%w(http https))
	validates :title, presence: true
	validates :user, presence: true

	# before_save :find_or_create_user

	def find_or_create_user
		user = User.where(username: self.user.username).first_or_create(username: self.user.username)
		self.user = user
	end
end

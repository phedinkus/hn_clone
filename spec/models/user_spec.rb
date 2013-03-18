require 'spec_helper'

describe User do
	it { should have_many :posts }
	it { should have_many :comments }

	it { should validate_presence_of :username }
end

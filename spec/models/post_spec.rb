require 'spec_helper'

describe Post do
	it { should belong_to :user }
	it { should have_many :comments }

	it { should validate_presence_of :url }
	it { should validate_presence_of :title }
	it { should validate_presence_of :user }

	context "url validations" do
	  it "should be valid with http urls" do
	    post = FactoryGirl.build(:post, url: "http://www.example.com")
	    post.should be_valid
	  end

	  it "should be valid with https urls" do
	    post = FactoryGirl.build(:post, url: "https://www.example.com")
	    post.should be_valid
	  end

	  it "should not allow a url without http/https" do
	    post = Post.new(url: "www.badexample.com")
	    post.should_not be_valid
	  end

	end
end

require 'spec_helper'

describe Post do
	it { should belong_to :user }

	it { should validate_presence_of :url }
	it { should validate_presence_of :title }
	it { should validate_presence_of :user }

	describe "#delegate" do
	  it "delegate username to user" do
	    post = FactoryGirl.create(:post)
	    expect(post.username).to eql(post.user.username)
	  end
	end

	describe "creation callback" do
		context "with an existing user" do
		  it "should assign the existing user" do
		    user = User.create(username: "something")
		    post = Post.new(url: "http://www.example.com", title: "New title", user: user)
		    post.save

		    expect { post.save }.to change(User, :count).by(0)
		  end
		end


	end
end

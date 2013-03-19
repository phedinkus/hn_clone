require 'spec_helper'
describe CommentsController do

  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { content: "something", user: { username: "Dino" } }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "POST create" do
    let(:saved_post) {FactoryGirl.create(:post)}
    describe "with valid params" do      
      it "creates a new Comment" do
        expect {
          post :create, post_id: saved_post.to_param, :comment => valid_attributes
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, post_id: saved_post.to_param, :comment => valid_attributes
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the created comment" do
        post :create, post_id: saved_post.to_param, :comment => valid_attributes
        response.should redirect_to(post_path(saved_post))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, post_id: saved_post.to_param, :comment => valid_attributes
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, post_id: saved_post.to_param, :comment => valid_attributes
        response.should render_template("posts/show")
      end
    end
  end
end

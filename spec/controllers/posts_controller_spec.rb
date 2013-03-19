require 'spec_helper'

describe PostsController do
  describe "GET index" do
    let(:post) { FactoryGirl.create :post }

    it "assigns all posts as @posts" do
      get :index
      assigns(:posts).should eq([post])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    let(:post) { FactoryGirl.create :post }
    
    it "assigns the requested post as @post" do
      get :show, {:id => post}
      assigns(:post).should eq(post)
    end

    it "renders the #show view" do
      get :show, {id: post}
      response.should render_template :show
    end
  end

  describe "GET new" do
    
    it "assigns a new post as @post" do
      get :new
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:saved_user) { FactoryGirl.create(:user) }
      let(:new_post) { {"title" => "new post", "url" => "http://www.example.com", "user" => {"username" => "example_user"}} }
      let(:new_post_with_saved_user) { {"title" => "new post", "url" => "http://www.example.com", "user" => {"username" => saved_user.username}} }


      it "creates a new Post" do
        expect {
          post :create, {:post => new_post }
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => new_post}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      context "with an existing user" do
        it "assigns that user to the post" do
          User.should_receive(:where).with({:username => "John"}).and_return(saved_user)
          saved_user.should_receive(:first_or_create)
          post :create, {:post => new_post_with_saved_user}
        end
      end

      context "with a unsaved user" do
        it "creates a new user" do
          expect {
            post :create, {:post => new_post }
          }.to change(User, :count).by(1)
        end      
      end

      it "redirects to the created post" do
        post :create, {:post => new_post}
        response.should redirect_to(posts_path)
      end
    end

    describe "with invalid params" do
      let(:invalid_post) { {"title" => "new post", "url" => "http://www.example.com", "user" => {"username" => nil}} }

      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => invalid_post}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => invalid_post}
        response.should render_template("new")
      end
    end
  end
end

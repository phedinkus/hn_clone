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
      let(:new_post) { {"title" => "new post", "url" => "http://www.example.com", "user" => ["username" => "example_user"]} }

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

      it "redirects to the created post" do
        post :create, {:post => new_post}
        response.should redirect_to(Post.last)
      end
    end

    describe "with invalid params" do

      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => FactoryGirl.build(:invalid_post)}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => FactoryGirl.build(:invalid_post)}
        response.should render_template("new")
      end
    end
  end
end

require "spec_helper"

describe PostsController do
  describe "routing" do

    it "routes to #index" do
      get("/posts").should route_to("posts#index")
    end

    it "routes to #new" do
      get("/posts/new").should route_to("posts#new")
    end

    it "routes to #show" do
      get("/posts/1").should route_to("posts#show", :id => "1")
    end

    it "routes to #create" do
      post("/posts").should route_to("posts#create")
    end
  end
end

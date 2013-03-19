LegitHn::Application.routes.draw do
	root :to => 'posts#index'
  
  resources :posts, :only => [:index, :show, :new, :create, :upvote] do 
    put :upvote
    resources :comments, :only => [:create]
  end
end

Rails.application.routes.draw do
	#get "/myarticles/:article_id" =>"articles#destroy_article", :as=>"destroy_article"
	 
	 delete "article/destroy_users/:user_id"=>"articles#destroy_users", :as=> "destroyuser"
	 get 'article/:user_id'=>'articles#activate_account!', :as=> "activate_account"
	 delete 'article/:user_id'=>'articles#deactivate_account!', :as=> "deactivate_account"
	  get "article/user_details/:user_id"=>"articles#change_role", :as=> "change_role"
	get '/user_details/:user_id' =>'articles#user_details' , :as=>"user_details"
	get '/myarticles/:user_id' =>'articles#myarticles', :as=>"myarticles"
delete 'articles/:article_id/destroy_image/:id' => 'articles#destroy_image' ,:as => 'destroy_image'
  devise_for :users
	root to: 'articles#index'
  resources :articles do
  resources :comments
end
resources :tags
end
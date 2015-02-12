class ArticlesController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show]
	before_filter :check_user, :only => [:edit]
  before_filter :check_active, :only => [:new]
  #before_filter :check, :only => [:sign_in]
	include ArticlesHelper
def index
  @articles = Article.all

end
def new
	@article = Article.new
end
def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    
    @comment.article_id = @article.id
    @attachment = @article.attachments
end
def create
  @article= Article.new(article_params)
  debugger
  if @article.save(article_params)
   flash.notice = "Article '#{@article.title}' created!"
  	redirect_to article_path(@article)
  else
    render :new 
end
if params[:images] != nil
params[:images].each do |image|
    @attachment= Attachment.new
    @attachment.article_id = @article.id
    @attachment.photo = image
    @attachment.save!
end
    end
end
def myarticles
@user= User.find(params[:user_id])
	end
def check_user
	 @article = Article.find(params[:id])
   unless current_user.is_active==true
     
   
	 unless current_user.email=="ankitkalia@poplify.com" || current_user.id ==@article.user_id
    redirect_to root_path
     end
   end
end
def check_active
  unless current_user.is_active==true
    redirect_to root_path
  end
    
  end
#def check
 #if @user.is_active==false
   #@user.is_active= true
 #end
 #@user.save
 # end
def user_details
  @user= User.all
end
def change_role
  @user = User.find(params[:user_id])
  if @user.roles==true
    @user.roles=false
  else
  @user.roles=true
  end

@user.save
redirect_to user_details_path
else
  end
def activate_account!
      @user =User.find(params[:user_id])
     if @user.is_active==false
          @user.is_active= true
          @user.save
           redirect_to user_profile_path(@user)
      end
 end

 def deactivate_account!

  @user =User.find(params[:user_id])
   if @user.is_active==true
   @user.is_active=false
     @user.save
     redirect_to user_profile_path(@user)
    end
 
    end
  #def destroy_article
    #@article =Article.find(params[:article_id])
    #@article.destroy
    #redirect_to destroy_article_path
  #end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
	flash.notice = "Article '#{@article.title}' Deleted!"
	redirect_to articles_path
end
def destroy_users
  @user = User.find(params[:user_id])
  @user.destroy
  redirect_to articles_path
end
def user_profile
    @user= User.find(params[:u_id])
end

def destroy_image
	
	@attachment =Attachment.find(params[:id])
	# @attachment = @article.attachments
	@attachment.destroy
	redirect_to article_path(params[:article_id])
end
def edit
  @article = Article.find(params[:id])
  @attachment= Attachment.new
end
def update
	@article = Article.find(params[:id])
	@article.update(article_params)
	# debugger
	 if params[:images] != nil
	   params[:images].each do |image|
    @attachment= Attachment.new
    @attachment.article_id = @article.id
    @attachment.photo = image
    @attachment.save!
    end
	flash.notice = "Article '#{@article.title}' Updated!"
	redirect_to article_path(@article)
end

end
end
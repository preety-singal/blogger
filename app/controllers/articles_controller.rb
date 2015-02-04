class ArticlesController < ApplicationController
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
  @article.save

  flash.notice = "Article '#{@article.title}' created!"
  redirect_to article_path(@article)
end
def destroy
	@article = Article.find(params[:id])
	@article.destroy
	flash.notice = "Article '#{@article.title}' Deleted!"
	redirect_to articles_path
end
def edit
  @article = Article.find(params[:id])
  @attachment= Attachment.new
end
def update
	@article = Article.find(params[:id])
	@article.update(article_params)
	# debugger
	   params[:images].each do |image|
   @attachment= Attachment.new
  @attachment.article_id = @article.id
  
  @attachment.photo = image
  @attachment.save
end
	flash.notice = "Article '#{@article.title}' Updated!"
	redirect_to article_path(@article)
end

end
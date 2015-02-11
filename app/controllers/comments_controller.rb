class CommentsController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show]
	def create
  @comment = Comment.new(comment_params)
  @comment.article_id = params[:article_id]
@article=Article.find(params[:article_id])
  @attachment=@article.attachments
 if @comment.save
 	@comment=Comment.new
 end
  # debugger
   respond_to do |format|
        
        format.js 
  end
end
def destroy
	@article = Article.find(params[:article_id])
	@comment = Comment.find(params[:id])
	@comment.destroy
	respond_to do |format|
      format.js 
   end
end
def edit
	@article = Article.find(params[:article_id])
	@comment = Comment.find(params[:id])
	respond_to do |format|
      format.js 
end	
	end
	def update
		 @article = Article.find(params[:article_id])
	@comment = Comment.find(params[:id])
	@comment.update(comment_params)
	respond_to do |format|
      format.js 
end	
end
def comment_params
  params.require(:comment).permit(:author_name, :body, :user_id)
end
end

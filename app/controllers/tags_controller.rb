class TagsController < ApplicationController
	
def show
	   @tag= Tag.find(params[:id])
		if params[:tag]

	else
		@article = Article.find(params[:article_id])
	end
	
end
def index
	@tags = Tag.all
end

def destroy
	@tag = Tag.find(params[:id])
	 @tag.articles.delete_all
	@tag.destroy
	
	flash.notice = "tag '#{@tag.name}' Deleted!"
	redirect_to tags_path
end
def edit
	@tag = Tag.find(params[:id])
	end
	def update
	@tag = Tag.find(params[:id])
	@tag.update(tag_params)
	# flash.notice = "Article '#{@article.title}' Updated!"
	redirect_to tags_path(@tag)
end
def tag_params
  params.require(:tag).permit(:name)
end
end

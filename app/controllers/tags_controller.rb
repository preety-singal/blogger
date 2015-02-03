class TagsController < ApplicationController
	def show
  @tag = Tag.find(params[:id])
end
def index
	@tags = Tag.all
end
attr_accessor :articles
def destroy
	@tag = Tag.find(params[:id])
	 @tag.articles.delete_all
	@tag.destroy
	# debugger
	flash.notice = "tag '#{@tag.name}' Deleted!"
	redirect_to tags_path
end
end

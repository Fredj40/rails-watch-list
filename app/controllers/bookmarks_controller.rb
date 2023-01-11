class BookmarksController < ApplicationController
before_action :find_list
before_action :find_bookmark, only: :destroy

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_bookmarks_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_bookmarks_path, status: :see_other
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end

end

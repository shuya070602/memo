class GenresController < ApplicationController
  before_action :authenticate_user!
  def index
    @genres = current_user.genres.all
    @genre = current_user.genres.new
  end

  def create
    @genres = current_user.genres.all
    @genre = current_user.genres.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render "index"
    end
  end

  def edit
    @genre = current_user.genres.find(params[:id])
  end

  def update
    @genre = current_user.genres.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path
    else
      render "edit"
    end
  end

  def destroy
    @genre = current_user.genres.find(params[:id])
    @genre.destroy
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :user_id)
  end

end

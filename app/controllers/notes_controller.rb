class NotesController < ApplicationController
  before_action :authenticate_user!
  def index
    @notes = Note.all
    @note = Note.new
    @genres = current_user.genres.all
    @genre = current_user.genres.new
    if params[:genres_select] == "0"
      @genre = current_user.genres.find(genre_params[name])
    elsif params[:genres_select] == "1"
      @genre = current_user.genres.new
      @genre.save
    end
  end

  def create
    @notes = Note.all
    @note = current_user.notes.new(note_params)
    @note.genre_id = current_user.id
    if @note.save
      redirect_to notes_path
    else
      render "index"
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to @note
    else
      render "edit"
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :user_id, :genre_id)
  end

  def genre_params
    params.require(:genre).permit(:name, :user_id)
  end

end

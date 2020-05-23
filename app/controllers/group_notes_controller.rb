class GroupNotesController < ApplicationController
  def index
    @group_notes = GroupNote.search(params[:search])
    @group_note = GroupNote.new
  end

  def create
    @group_notes = GroupNote.all
    @group_note = GroupNote.new(group_note_params)
    @group_note.group_id = params[:group_note][:group_id]
    if @group_note.save
      redirect_to group_notes_path
    else
      render "index"
    end
  end

  def show
    @group_note = GroupNote.find(params[:id])
  end

  def edit
    @group_note = GroupNote.find(params[:id])
  end

  def update
    @group_note = GroupNote.find(params[:id])
    if @group_note.update(group_note_params)
      redirect_to @group_note
    else
      render "edit"
    end
  end

  def destroy
    @group_note = GroupNote.find(params[:id])
    @group_note.destroy
    redirect_to group_notes_path
  end

  private

  def group_note_params
    params.require(:group_note).permit(:group_id, :title, :body)
  end

end

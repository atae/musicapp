class NotesController < ApplicationController
  def create
    new_note = Note.new(note_params)
    new_note.author_id = current_user.id
    if new_note.valid?
      new_note.save
      redirect_to track_url(new_note.track_id)
    else
      flash[:error] = new_note.errors.full_messages
      redirect_to track_url(new_note.track_id)
    end
  end

  def destroy
    current_note = Note.find(delete_params[:id])
    if current_user != current_note.author
      render text: "403 FORBIDDEN"
    else
      track = current_note.track
      Note.destroy(delete_params[:id])
      redirect_to track_url(track)
    end
  end


  private
  def note_params
    params.require(:note).permit(:note, :author_id, :track_id)
  end

  def delete_params
    params.require(:delete_note).permit(:id)
  end

end

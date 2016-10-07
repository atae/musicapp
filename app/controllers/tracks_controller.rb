class TracksController < ApplicationController
  before_action :redirect_logged_out

  #creation pair
  def new
    @album = Album.find(params[:album_id])
    render :new
  end

  def create
    new_track = Track.new(tracks_params)
    if new_track.valid?
      new_track.save
      redirect_to track_url(new_track)
    else
      flash[:error] = new_track.errors.full_messages
      render :new
    end
  end

  #editing pair
  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    track = Track.find(params[:id])
    if track.nil?
      flash.now[:errors] = ['Track not found']
      render :edit
      return nil
    end

    pending_track = Track.new(tracks_params)
    if track.valid?
      track.update!(tracks_params)
      flash[:errors] = ["Track updated!"]
      redirect_to track_url(track)
    else
      flash.now[:errors] = pending_track.errors.full_messages
      render :edit
    end

  end

  #show and delete pair
  def show
    @track = Track.find(params[:id])
    render :show
  end

  def destroy
    album = Track.find(params[:id]).album
    Track.destroy(params[:id])
    redirect_to album_url(album)
  end

  private
  def tracks_params
    params.require(:track).permit(:title, :album_id, :bonus?, :lyrics)
  end
end

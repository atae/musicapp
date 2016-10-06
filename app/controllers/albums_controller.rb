class AlbumsController < ApplicationController
  #creation pair
  def new
    @band = Band.find(params[:band_id])
    @band ||= Band.new
    render :new
  end

  def create
    new_album = Album.new(album_params)
    if new_album.valid?
      new_album.save
      redirect_to album_url(new_album)
    else
      flash.now[:errors] = new_album.errors.full_messages
      render :new
    end

  end

  #editing pair
  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    album = Album.find(params[:id])
    if album.nil?
      flash.now[:errors] = ['Band not found']
      render :edit
      return nil
    end

    pending_album = Album.new(album_params)
    if album.valid?
      album.update!(album_params)
      redirect_to album_url(album)
    else
      flash[:errors] = pending_album.errors.full_messages
      render :edit
    end
  end

  #show and delete pair
  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    band = Album.find(params[:id]).band
    Album.destroy(params[:id])
    redirect_to band_url(band)
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :live?, :title)
  end

end

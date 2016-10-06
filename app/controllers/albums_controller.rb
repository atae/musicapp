class AlbumsController < ApplicationController
  #creation pair
  def new
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
    render :edit
  end

  def update
  end

  #show and delete pair
  def show
    render :show
  end

  def destroy
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :live?, :title)
  end

end

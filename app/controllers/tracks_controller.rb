class TracksController < ApplicationController
  #creation pair
  def new
    render :new
  end

  def create
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
  def tracks_params
    params.require(:track).permit(:title, :album_id, :bonus?, :lyrics)
  end
end

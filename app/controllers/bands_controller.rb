class BandsController < ApplicationController
  before_action :redirect_logged_out
  #show all bands
  def index
    @bands = Band.all
    render :index
  end

  #creation pair
  def new
    render :new
  end

  def create
    new_band = Band.new(bands_params)
    if new_band.valid?
      new_band.save
      redirect_to band_url(new_band)
    else
      flash.now[:errors] = new_band.errors.full_messages
      render :new
    end
  end

  #editing pair
  def edit
    @band = Band.find(params[:id])

    render :edit
  end

  def update
    band = Band.find(params[:id])
    if band.nil?
      flash.now[:errors] = ['Band not found']
      render :edit
      return nil
    end

    pending_band = Band.new(bands_params)
    if band.valid?
      band.update!(bands_params)
      flash[:errors] = ["Band updated!"]
      redirect_to band_url(band)
    else
      flash.now[:errors] = pending_band.errors.full_messages
      render :edit
    end
  end

  #show and delete pair
  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    Band.destroy(params[:id])
    redirect_to bands_url
  end

  private
  def bands_params
    params.require(:bands).permit(:name)
  end
end

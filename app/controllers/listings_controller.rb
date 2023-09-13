class ListingsController < ApplicationController

  def index
   @listings = Listing.all
   render json: @listings
  end

  def show
    @listing = Listing.find(params[:id])
    render json: @listing
  end

  # def new
  #   @listing = Listing.new
  #   render json: @listing.to_json
  # end

  def create
    @listing = Listing.create!
    render json: @listing
  end

  # def edit
  #   @listing = Listing.find(id: params[:id])
  #   render json: @listing.to_json
  # end

  def update
    @listing = Listing.find(params[:id])
    @listing.update
    render json: @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
  end

  private

  def listing_params
    params.require(:listing).permit(:id, :num_rooms)
  end
end

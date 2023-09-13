class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    render json: @Booking
  end

   # def new
   #   @Booking = Booking.new
   #   render json: @Booking.to_json
   # end

  def create
    listing = Listing.find(params[:id])
    @booking = Booking.create!(listing: listing)
    render json: bBooking
  end

   # def edit
   #   @booking = Booking.find(id: params[:id])
   #   render json: @Booking.to_json
   # end

  def update
    @booking = Booking.find(params[:id])
    @booking.update
    render json: @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:id)
  end
end

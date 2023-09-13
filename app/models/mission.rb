class Mission < ApplicationRecord
  belongs_to :listing


  def first_checkin
    listing = Listing.find(params[:id])
    price = 10 * listing.num_rooms
    bookings = listing.bookings
    type = 'first_checkin'
    bookings.each do |booking|
      Mission.create!(listing: listing, mission_type: type, date:booking.start_date, price: price)
    end
  end

  def last_checkout
    listing = Listing.find(params[:id])
    price = 5 * listing.num_rooms
    bookings = listing.bookings
    type = 'last_checkout'
    bookings.each do |booking|
      Mission.create!(listing: listing, mission_type: type, date:booking.end_date, price: price)
    end
  end

  def checkout_checkin
    listing = Listing.find(params[:id])
    price = 10 * listing.num_rooms
    checkout = listing.missions.select(mission_type = "last_checkout").date
    reservations = listing.reservations
    type = 'checkout_checkin'
    reservations.each do |reservation|
      if reservation.end_date =! checkout
        Mission.create!(listing: listing, mission_type: type, date:booking.end_date, price: price)
      end
    end
  end
end

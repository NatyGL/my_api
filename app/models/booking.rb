class Booking < ApplicationRecord
  belongs_to :listing
  after_destroy :cancel

  def cancel
    Reservation.where(listing:).where(start_date: start_date..end_date, end_date: start_date..end_date).destroy_all
  end
end

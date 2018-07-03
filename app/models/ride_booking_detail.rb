class RideBookingDetail < ActiveRecord::Base
  belongs_to :booking_user_id
  belongs_to :ride_id
  attr_accessible :amount, :msg, :payment_mode, :seats, :transaction_id, :ride_id_id
end

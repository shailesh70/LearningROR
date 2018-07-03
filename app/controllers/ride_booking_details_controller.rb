class RideBookingDetailsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :new]
  before_filter :correct_user,   only: :destroy


  def new
    @ridebookdetail = RideBookingDetail.new
    @ride_id = params[:ride_id]
    @ridedetail=Ride.find(params[:ride_id])
    @seatcount=[]
    i=0
    @ridedetail.seats.times do |r|
      temp=[r+1,r+1]
      @seatcount[i]=temp
      i+=1
    end
  end

  def create
    @ridebookdetail = RideBookingDetail.new(params[:ride_booking_detail])
    @ridebookdetail.booking_user_id_id=current_user.id
    @seatbook=@ridebookdetail.seats.to_i
  	if @ridebookdetail.save
        Ride.where(:id => @ridebookdetail.ride_id_id ).update_all("seats=seats- #{@seatbook}")                  
      	flash[:success] = "Ride Booked Sucessfully!"
        show
        render :show
  	else
  		render 'new'
  	end
  end

  def show
    @bookingHistory = RideBookingDetail.all(:conditions => {:booking_user_id_id  => current_user.id})
    #@bookingHistorydetails = RideBookingDetail.joins(:ride_id_id).where(booking_user_id_id: current_user.id)
    #@bookingHistorydetails = 
    p '*********************************'
    #p @bookingHistorydetails
    p '*********************************'
  end

  private
    def update_ride(rid,seat)
        # Ride.where(:id =>  ).update_all
    end

end
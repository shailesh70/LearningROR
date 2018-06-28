class RidesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index_offer_ride
    @listOfRide=Ride.all(:conditions => {:user_id_id  => current_user.id})
  end

  def index_find_ride
    # p '======================================='
    # p @currdate
    if params[:journey_date] 
      @currdate=params[:journey_date]
    end
    # p '======================================='
    # p params[:journey_date]
    # p @currdate
    # p '======================================'
    params[:source]=params[:source].to_s.downcase
    params[:destination]=params[:destination].to_s.downcase
    @matchRide = Ride.where(source: params[:source], destination: params[:destination], date_of_journey: params[:journey_date] )
  end

  def new
   @ride = Ride.new
  end


  def create
  	@ride = Ride.new(params[:ride])
    @ride.date_of_journey=params[:journey_date]
    # p '======================================='
    # p @ride.date_of_journey
    # p '======================================'
    @ride.user_id_id=current_user.id
  	if @ride.save
      	flash[:success] = "Ride Post Sucessfully!"
        index_offer_ride
      	render 'rides/index_offer_ride'
  	else
  		render 'new'
  	end
  end

  def show
    @ridedetail = Ride.find(params[:id])
  	@userdetail = User.find(@ridedetail.user_id_id)

    
    # p '======================================='
    # p params[:id]
    # p @userdetail
    # p '======================================'
    
    # p @ridedetail
    # p '======================================'
  end
end
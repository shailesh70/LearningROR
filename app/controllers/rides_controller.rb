class RidesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :new]
  before_filter :correct_user,   only: :destroy

  def index_offer_ride

    @listOfRide=Ride.all(:conditions => {:user_id_id  => current_user.id})

  end

  def index_find_ride
    if params[:journey_date] 
      @currdate=params[:journey_date]
    end
    id= "#{params[:source]}#{params[:destination]}#{params[:journey_date]}"
    p '======================================='
    p id
    p '======================================'
    find = Rails.cache.read id

    if find
      @matchRide=find
    else
      @matchRide = Ride.where(source: params[:source], destination: params[:destination], date_of_journey: params[:journey_date] ).where('seats > 0').order('seats desc')
      Rails.cache.write id, @matchRide
    end
    # id = 23;
    # my_data = array('name' => 'gon', 'occupation' => 'hunter');
    # ttl = 60;
    # mem->set($id, $my_data, $ttl);
    params[:source]=params[:source].to_s.downcase
    params[:destination]=params[:destination].to_s.downcase
    # @matchRide = Ride.where(source: params[:source], destination: params[:destination], date_of_journey: params[:journey_date] ).where('seats > 0').order('seats desc')
    

    p @matchRide
    p ' *****************************************'
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
    # redirect_to :controller => 'ride_booking_details', :action => 'create'
    # redirect_to ride_booking_details(ride_id: params[:id])
    
    # p '======================================='
    # p @ridedetail
    # p '======================================'
  end
end
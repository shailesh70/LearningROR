class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user,   only: [:edit, :update]

	def new
		@user=User.new
	end

	def create
	    @user = User.new(params[:user])
	    if @user.save
	      sign_in @user
	      redirect_to @user
	      flash[:success] = "Welcome to the BlaBlaCar !"
	    else
	      render 'new'
	    end
	end
	
	def show
		@user=User.find(params[:id])
	end

	def edit
  	end

  	def update
	    if @user.update_attributes(params[:user])
	      flash[:success] = "Profile updated"
	      sign_in @user
	      redirect_to @user
	    else
	      render 'edit'
	    end
  	end

  	private

	    def correct_user
	      @user = User.find(params[:id])
	      redirect_to(root_url) unless current_user?(@user)
	    end
end

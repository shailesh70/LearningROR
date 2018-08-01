class EmailFilterController < ApplicationController
  def index
    @domain_list = EmailFilter.all_v
    # byebug
  end

  def create
    EmailFilter[params[:domain]] = 1

    flash[:success] = "Added new Email Filter"
    redirect_to email_filter_index_path
  end

  def destroy
    p '++++++++++++++++++++++++'
    p params
    p '++++++++++++++++++++++++'
    EmailFilter.delete(params[:domain_name])

    flash[:success] = "Filter deleted"
    redirect_to email_filter_index_path
  end
end
class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @shares = Share.all
  end

  def show
    @shares = Share.all
    render 'dashboards/dashboard'
  end


end

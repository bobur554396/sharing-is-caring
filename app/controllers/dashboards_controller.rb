class DashboardsController < ApplicationController
  skip_authorization_check
  load_and_authorize_resource
  skip_before_action :authenticate_user!
  
  def show
    @markdown = get_markdown_renderer
    @shares = Share.all
    render 'dashboards/dashboard'
  end
  
  # def dashboard
  #   @shares = Share.all
  # end
end
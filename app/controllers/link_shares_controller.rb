class LinkSharesController < ApplicationController
  load_and_authorize_resource
  layout 'blank'
  def new
    @link_share = LinkShare.new(author_id: current_user.id)
    render :new
  end
  
end
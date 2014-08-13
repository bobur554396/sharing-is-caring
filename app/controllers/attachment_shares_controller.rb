class AttachmentSharesController < ApplicationController
  load_and_authorize_resource
  layout 'blank'
  def new
    @attachment_share = AttachmentShare.new(author_id: current_user.id)
    render :new
  end
  
  # def show
  #   @share = Share.find(params[:id])
  # end
  
end
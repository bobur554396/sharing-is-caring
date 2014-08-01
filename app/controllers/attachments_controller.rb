class AttachmentsController < ApplicationController

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.document = params[:attachment][:document]
    @attachment.save
    respond_with @attachment
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def attachment_params
    params.require(:attachment).permit(:document)
  end
end
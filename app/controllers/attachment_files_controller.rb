class AttachmentFilesController < ApplicationController

  def new
    @attachment_file = AttachmentFile.new
  end

  def create
    @attachment_file = AttachmentFile.new(attachment_file_params)
    @attachment_file.document = params[:attachment_file][:document]
    @attachment_file.save
    respond_with @attachment_file
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def attachment_file_params
    params.require(:attachment_file).permit(:document)
  end
end
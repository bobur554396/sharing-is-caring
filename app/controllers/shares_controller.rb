class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  
  def index
    @shares = Share.all
  end


  def new
    @share = current_user.shares.new
    render :new
  end
  
  def create
    @markdown = get_markdown_renderer
		@share = current_user.shares.new(share_params)

		if @share.save
      notice: 'Share created successfully'
		else
			notice: "#{@share.errors.full_messages}"
		end
    render 'dashboards/dashboard'
	end

  # GET /shares/1/edit
  def edit
    render :edit
  end

  # PATCH/PUT /shares/1
  def update
    @share.update_attributes(share_params)
    if @share.save
      render 'dashboards/dashboard', notice: 'Share was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shares/1
  def destroy
    @share.destroy
    redirect_to 'dashboards/dashboard', notice: 'Share was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
      @share = Share.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def share_params
      params.require(:share).permit(:author_id, :title, :content, :actable_id, :actable_type, attachment_file_attributes: [:document, :attachment_id])
    end
end

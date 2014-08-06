class ResourcesController < ApplicationController
  load_and_authorize_resource
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_resource, only: [:show, :edit, :update, :destroy]


  # GET /resources
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  def show
    @resource = Resource.find(params[:id])
  end

  # GET /resources/new
  def new
    @user = current_user
    @resource = @user.resources.new
    @hashtag = SimpleHashtag::Hashtag.new
    @resource.hashtags << @hashtag
    @attachment = @resource.attachments.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  def create
    @user = current_user
    @resource = @user.resources.new(resource_params)
    @resource.save



    if @resource.save
      @hashtags = @resource.hashtags
      if params[:documents]
        params[:documents].each do |document|
          @resource.attachments.create(document: document, title: params[:attachment][:title], description: params[:attachment][:description])
        end
      end
      redirect_to '/', notice: 'Resource was successfully created.'
    else
      redirect_to '/', alert: 'Error creating post. Try again.'
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: 'Resource was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
    redirect_to resources_url, notice: 'Resource was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resource).permit(:content, :user_id, :hashtag_id, :documents, attachment_attributes: [:title, :description] )
    end
end

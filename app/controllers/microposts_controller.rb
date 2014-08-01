class MicropostsController < ApplicationController
  load_and_authorize_resource
  skip_authorization_check
  skip_before_action :authenticate_user!
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]


  # GET /microposts
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/1
  def show
    @micropost = Micropost.find(params[:id])
  end

  # GET /microposts/new
  def new
    @user = current_user
    @micropost = @user.microposts.new
    @hashtag = SimpleHashtag::Hashtag.new
    @micropost.hashtags << @hashtag
    @attachment = @micropost.attachments.new
  end

  # GET /microposts/1/edit
  def edit
  end

  # POST /microposts
  def create
    @user = current_user
    @micropost = @user.microposts.new(micropost_params)
    @micropost.save
    @hashtags = @micropost.hashtags
    # @attachments = @micropost.attachments

    if @micropost.save
      if params[:documents]
        params[:documents].each do |document|
          @micropost.attachments.create(document: document)
        end
      end
      redirect_to '/', notice: 'Micropost was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /microposts/1
  def update
    if @micropost.update(micropost_params)
      redirect_to @micropost, notice: 'Micropost was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /microposts/1
  def destroy
    @micropost.destroy
    redirect_to microposts_url, notice: 'Micropost was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id, :hashtag_id, :documents)
    end
end

class CampaignsController < ApplicationController
	before_filter :signed_in_user, only: [:index, :show, :destory, :edit, :update]
  before_filter :admin_user, only: :destroy


	def index
		@campaigns = Campaign.paginate(page: params[:page])
	end

	def show
		@campaign = Campaign.find(params[:id])
    @appeals = @campaign.appeals
	end

	def create
    	@campaign = Campaign.new(params[:campaign]) # Not the final implementation
    	if @campaign.save
      			flash[:success] = "New Campaign Created!"
      		redirect_to @campaign
    	else
      		render 'new'
    	end
  end

  def destroy
  		Campaign.find(params[:id]).delete
  		flash[:success] = "Campaign Deleted"
  		redirect_to campaigns_path
  end

  def new
      @client = Client.find(params[:client_id])
      @campaign = @client.campaigns.build  # Not the final implementation
  end


end

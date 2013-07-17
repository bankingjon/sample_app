class CampaignsController < ApplicationController
	

	def new
		@campaign = Campaign.new
	end

	def index
		@campaigns = Campaign.paginate(page: params[:page])
	end

	def show
		@campaign = Campaign.find(params[:id])
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

end

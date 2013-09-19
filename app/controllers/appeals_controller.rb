class AppealsController < ApplicationController
before_filter :signed_in_user, only: [:index, :import, :destory]
before_filter :admin_user, only: [:import, :destroy]



def index
	respond_to do |format|
		format.html {
			@campaign = Campaign.find(params[:campaign_id])
			@appeals = @campaign.appeals.paginate(page: params[:page])
		}
		format.csv {
			@campaign = Campaign.find(params[:campaign_id])
			@appeals = @campaign.appeals
			send_data Appeal.to_csv(@campaign)
		}
	#format.json { render json: AppealsDatatable.new(view_context) }
	end
end

def import
	@campaign = Campaign.find(params[:campaign_id])
  	@file = params[:file]
  	CSV.foreach(@file.path, headers: true) do |row|
  		@campaign.appeals.create! row.to_hash
  	end
	flash[:success] = "Appeals Data imported."
	redirect_to @compaign 
end

def destory
end


end

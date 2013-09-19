class DonationsController < ApplicationController
before_filter :signed_in_user, only: [:index, :show, :destory, :edit, :update]
before_filter :admin_user, only: :destroy

def index
	respond_to do |format|
		format.html {
			@client = Client.find(params[:client_id])
			@campaigns = @client.campaigns
			@donations = @client.donations.paginate(page: params[:page])
		}
		format.csv {
			@client = Client.find(params[:client_id])
			@donations = @client.donations
			send_data Donation.to_csv(@client)
		}
	#format.json { render json: AppealsDatatable.new(view_context) }
	end
end

def display
	respond_to do |format|
		format.html {
			@campaign = Campaign.find(params[:campaign_id])
			@client = Client.find(@campaign.client_id)
			@donations = @campaign.donations.paginate(page: params[:page])
		}
		format.csv {
			@campaign = Campaign.find(params[:campaign_id])
			@donations = @campaign.donations
			send_data Donation.to_csv(@campaign), :filename => "<%= campaign.name %>'.csv'"
		}
	#format.json { render json: AppealsDatatable.new(view_context) }
	end
end


def show
end

def destory
end

def edit
end

def update
end

def import
end
	
end
end

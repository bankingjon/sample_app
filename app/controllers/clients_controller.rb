class ClientsController < ApplicationController
before_filter :signed_in_user, only: [:index, :create, :new, :show, :destory, :edit, :update]
before_filter :admin_user, only: [:new, :create, :destroy]

	def index
		@clients = Client.all

	end

	def create
		@client = Client.new(params[:client]) #Not the final implementation
	    if @client.save
	      flash[:success] = "New Client Created!"
	      redirect_to @client
	    else
	      render 'new'
	    end
	end

	def new
		@client = Client.new
	end
	
	def show
		@client = Client.find(params[:id])
		@campaigns = @client.campaigns.paginate(page: params[:page])
	end

	def destroy
	end

	def edit
	end
	
	def update
	end

	private 

	def admin_user
    redirect_to(root_path) unless current_user.admin?
  	end

end

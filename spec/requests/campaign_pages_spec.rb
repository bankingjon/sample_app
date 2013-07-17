require 'spec_helper'

describe "Campaign Pages" do

  subject { page }

  describe "index" do
  	before do
  		sign_in FactoryGirl.create(:user)
  		FactoryGirl.create(:campaign, name: "fall 2013 appeal", drop_date: "1/1/2013")
  		FactoryGirl.create(:campaign, name: "fall 2013 appeal", drop_date: "1/1/2013")
  		visit campaigns_path
  	end

  	it { should have_selector('title', text: "All campaigns") }
  	it { should have_content('All campaigns') }

  	describe "pagination" do

  		before(:all) { 30.times { FactoryGirl.create(:campaign) } }
  		after(:all) { Campaign.delete_all }

  		it "should list each campaign" do
  			Campaign.paginate(page: 1).each do |campaign|
  				expect(page).to have_selector('l1', text: campaign.name)
  			end
  		end
  	end
  end

  describe "Campaign profile page" do
  	# Replace with code to make a campaign variable
  	let(:campaign) { FactoryGirl.create(:campaign) }
    before { visit campaign_path(campaign) }

    it { should have_content(campaign.name) }
    it { should have_selector('title', text: campaign.name) }
  end

  describe "new campaign" do 

  	before { visit new_campaign_path }

  	let(:submit) { "Create New Campaign" }

  	describe "with invalid information" do
  		it "should not create a campaign" do
  			expect { click_button submit }.not_to change(Campaign, :count)
  		end
  	end

  	describe "with valid information" do
  		before do
  			fill_in "Name",  with: "Example Campaign"
  			fill_in "Mail Date", with: "1/1/2013"
  		end

  		it "should create a campaign" do
  			expect { click_button submit }.to change(Campaign, :count).by(1)
  		end
  	end
  end
end

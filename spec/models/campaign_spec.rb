require 'spec_helper'

describe Campaign do
  
  before { @campaign = Campaign.new(name: "Fall Appeal 2013", drop_date: "1/1/2013", client_id: "1", mp_managed: "0")}

  subject { @campaign }

  it { should respond_to(:name) }
  it { should respond_to(:drop_date) }
  it { should respond_to(:appeals) }
  it { should respond_to(:donations) }
  it { should respond_to{:client_id} }
  it { should respond_to(:mp_managed) }

  describe "when name is not present" do
    before { @campaign.name = " " }
    it { should_not be_valid }
  end

  describe "when client_id is not present" do
    before { @campaign.client_id = " "}
    it { should_not be_valid }
  end

  describe "when mp_managed is not present" do
    before { @campaign.mp_managed = nil }
    it { should_not be_valid }
  end  

  describe "appeal associations"

    before { @campaign.save }
    let!(:appeal1) do
      FactoryGirl.create(:appeal, campaign: @campaign)
    end
    let!(:appeal2) do
      FactoryGirl.create(:appeal, campaign: @campaign)
    end

    it "should destroy associated appeals" do
      appeals = @campaign.appeals.to_a
      @campaign.destroy
      expect(appeals).not_to be_empty
      appeals.each do |appeal|
        expect(Appeal.where(id: appeal.id)).to be_empty
      end
    end
  end

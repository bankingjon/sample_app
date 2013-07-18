require 'spec_helper'

describe Campaign do
  
  before { @campaign = Campaign.new(name: "Fall Appeal 2013", drop_date: "1/1/2013")}

  subject { @campaign }

  it { should respond_to(:name) }
  it { should respond_to(:drop_date) }
  it { should respond_to(:appeals) }
  it { should respond_to(:donations)}

  describe "when name is not present" do
    before { @campaign.name = " " }
    it { should_not be_valid }
  end

  describe "when drop_date is not present" do
    before { @campaign.drop_date = " " }
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

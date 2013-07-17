require 'spec_helper'

describe Appeal do

  let(:campaign) { FactoryGirl.create(:campaign) }
  before { @appeal = campaign.appeals.build(client_file_id: "12345", ask1: "10",
                      ask2: "50", ask3: "100", mailcode: "M00001",
                      scanline: "00001238M0001SD01", tier: "1",
                      tiercode: "SD001", mailtype: "First Class") }

  subject { @appeal }

  it { should respond_to(:client_file_id) } 
  it { should respond_to(:ask1) }
  it { should respond_to(:ask2) }
  it { should respond_to(:ask3) }
  it { should respond_to(:mailcode) }
  it { should respond_to(:scanline) }
  it { should respond_to(:tier) }
  it { should respond_to(:tiercode) }
  it { should respond_to(:mailtype) }
  it { should respond_to(:campaign_id) }
  it { should respond_to(:campaign) }
  its(:campaign) { should eq campaign}

  it { should be_valid }

  describe "when campaign_id is not present" do
    before { @appeal.campaign_id = nil }
    it { should_not be_valid }
  end

  describe "when client_file_id is not present" do
    before { @appeal.client_file_id = " " }
    it { should_not be_valid }
  end

  describe "when scanline is not present" do
    before { @appeal.scanline = " " }
    it { should_not be_valid }
  end

end

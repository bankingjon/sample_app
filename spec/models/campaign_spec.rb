require 'spec_helper'

describe Campaign do
  
  before { @campaign = Campaign.new(name: "Fall Appeal 2013", drop_date: "1/1/2013")}

  subject { @campaign }

  it { should respond_to(:name) }
  it { should respond_to(:drop_date) }

  describe "when name is not present" do
    before { @campaign.name = " " }
    it { should_not be_valid }
  end

  describe "when drop_date is not present" do
    before { @campaign.drop_date = " " }
    it { should_not be_valid }
  end



end

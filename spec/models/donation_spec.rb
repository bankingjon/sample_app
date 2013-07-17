require 'spec_helper'

describe Donation do
  

  # Create new donation instance for testing
  before { @donation = Donation.new(gift_id: "1", client_file_id: "1234", gift_date: "1/1/2013", 
  						channel: "web", campaign: "Fall Appeal 2013", 
  						scanline: "123345", amount: "123.50") }

  subject { @donation }

  # Testing responsiveness
  it { should respond_to(:gift_id) }
  it { should respond_to(:client_file_id) }
  it { should respond_to(:gift_date) }
  it { should respond_to(:channel) }
  it { should respond_to(:campaign) }
  it { should respond_to(:scanline) }
  it { should respond_to(:amount) }

  describe "when gift_id is not present" do
    before { @donation.gift_id = " " }
    it { should_not be_valid }
  end

  describe "when client_file_id is not present" do
    before { @donation.client_file_id = " " }
    it { should_not be_valid }
  end

  describe "when gift_date is not present" do
    before { @donation.gift_date = " " }
    it { should_not be_valid }
  end

 describe "when amount is not present" do
    before { @donation.amount = " " }
    it { should_not be_valid }
  end



end

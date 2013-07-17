require 'spec_helper'

describe Donor do
  
  before { @donor = Donor.new(client_file_id: "12345", name: "John Doe",
  					address: "123 Main Street, Any Town, Illinois, 60618") }

  subject { @donor }

  it { should respond_to(:client_file_id) }
  it { should respond_to(:address) }
  it { should respond_to(:name) }

  describe "when client_file_id is not present" do
    before { @donor.client_file_id = " " }
    it { should_not be_valid }
  end


end

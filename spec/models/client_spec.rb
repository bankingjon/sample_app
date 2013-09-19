require 'spec_helper'

describe Client do
  
  before { @client = Client.new(name: "Favorite Client") }

  subject { @client }

  it { should respond_to(:name) }

  describe "when name is not present" do
    before { @client.name = " " }
    it { should_not be_valid }
  end

end

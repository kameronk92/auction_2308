require "./spec/spec_helper"

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@auction).to be_an_instance_of(Auction)
      expect(@auction.items).to eq([])
    end
  end
end
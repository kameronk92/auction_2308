require "./spec/spec_helper"

RSpec.describe Auction do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@auction).to be_an_instance_of(Auction)
      expect(@auction.items).to eq([])
    end
  end

  describe "#add_item" do
    it "adds an item to the auction" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
    end
  end

  describe 'unpopular_items' do 
    it "returns an array of items without bids" do 
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @item3.add_bid(@attendee1, 10)
      expect(@auction.unpopular_items).to eq([@item1, @item2])
    end
  end

  describe "potential_revenue" do
    it "returns an integer sum of bids" do 
      expect(@auction.potential_revenue).to eq(0)
      @auction.add_item(@item1) 
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq(87)
    end
  end

  describe "#bidders" do
    it "returns an array of bidders names as a string" do 
      expect(@auction.bidders).to eq([])
      @auction.add_item(@item1) 
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.bidders).to eq(["Bob", "Megan", "Mike"])
    end
  end

  describe '#bidder_info' do
    it 'returns a big ol hash of bidder_info with attendees as keys' do
      @auction.add_item(@item1) 
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
require 'pry'; binding.pry
      expect(@auction.bidder_info).to be_an_instance_of(Hash) 
    end
  end
end

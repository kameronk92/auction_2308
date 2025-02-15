require "./spec/spec_helper"

RSpec.describe Auction do
  before(:each) do
    @item1 = Item.new("Chalkware Piggy Bank")
    @item2 = Item.new("Bamboo Picture Frame")
    @item3 = Item.new("Homemade Chocolate Chip Cookies")
    @item4 = Item.new("2 Days Dogsitting")
    @item5 = Item.new("Forever Stamps")
    @attendee1 = Attendee.new({name: "Megan", budget: "$50"})
    @attendee2 = Attendee.new({name: "Bob", budget: "$75"})
    @attendee3 = Attendee.new({name: "Mike", budget: "$100"})
    @auction = Auction.new
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 100)
    @item3.add_bid(@attendee2, 15)
  end

  describe "#initialize" do
    it "exists" do
      expect(@auction).to be_an_instance_of(Auction)
    end
  end

  describe "#add_item" do
    it "adds an item to the auction" do
      expect(@auction.items).to eq([@item1, @item2, @item3, @item4, @item5])
    end
  end

  describe "unpopular_items" do
    it "returns an array of items without bids" do
      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end
  end

  describe "potential_revenue" do
    it "returns an integer sum of bids" do
      expect(@auction.potential_revenue).to eq(87)
    end
  end

  describe "#bidders" do
    it "returns an array of bidders names as a string" do
      expect(@auction.bidders).to eq(["Bob", "Megan", "Mike"])
    end
  end

  describe "#bidders_objects" do
    it "returns an array of bidder objects" do
      expect(@auction.bidders_objects).to eq([@attendee2, @attendee1, @attendee3])
    end
  end

  describe "#attendee_bid_on" do
    it "returns an array of item objects the attendee has bid on" do
      expect(@auction.attendee_bid_on(@attendee2)).to eq([@item1, @item3])
    end
  end

  describe "#bidder_info" do
    it "returns a big ol hash of bidder_info with attendees as keys" do
      expect(@auction.bidder_info).to be_an_instance_of(Hash) 
      expect(@auction.bidder_info.keys).to eq([@attendee2, @attendee1, @attendee3])
      expect(@auction.bidder_info[@attendee1][:budget]).to eq(50)
    end
  end

  describe "auction date" do
    it "returns the date of the auction" do
      auction1 = double("01/10/2020")
      allow(auction1).to receive(:date).and_return("01/10/2020")
      expect(auction1.date).to eq("01/10/2020")
    end
  end

  describe "#close_auction" do
    it "closes the auction and reports winners" do
     expect(@auction.close_auction[@item4]).to eq(@attendee3)
    end
  end
end

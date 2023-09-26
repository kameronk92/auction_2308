require "./spec/spec_helper"

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @item6 = Item.new("Kam's Turing Macbook")
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@item1).to be_an_instance_of(Item)
      expect(@item1.name).to eq("Chalkware Piggy Bank")
    end
  end

  describe '#add_bid' do
    it 'adds bids to the item' do
      expect(@item1.bids).to eq({})
      @item1.add_bid(@attendee2, 20)
      expect(@item1.bids).to eq({@attendee2 => 20})
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
    end
  end

  describe '#current_high_bid' do
    it 'returns the highest bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
    end
  end

  describe '#close_bidding' do
    it 'changes the value of @closed to true' do
      expect(@item6.closed).to eq(false)
      @item6.close_bidding
      expect(@item6.closed).to eq(true)
    end
  end
end
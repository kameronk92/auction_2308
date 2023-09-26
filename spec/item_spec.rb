require "./spec/spec_helper"

RSpec.describe Item do
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
      expect(@item1).to be_an_instance_of(Item)
      expect(@item1.name).to eq("Chalkware Piggy Bank")
    end
  end

  describe '#add_bid' do
    it 'adds bids to the item' do
      expect(@item1.bids).to eq({})
      @item1.add_bid(@attendee2, 20)
      expect(@item1.bids).to eq({@attendee2 => 20})
    end
  end
end
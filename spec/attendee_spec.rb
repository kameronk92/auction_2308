require "./spec/spec_helper"

RSpec.describe Attendee do
  before(:each) do
    # @item1 = Item.new('Chalkware Piggy Bank')
    # @item2 = Item.new('Bamboo Picture Frame')
    # @item3 = Item.new('Homemade Chocolate Chip Cookies')
    # @item4 = Item.new('2 Days Dogsitting')
    # @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    # @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    # @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    # @auction = Auction.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@attendee1).to be_an_instance_of(Attendee)
      expect(@attendee1.name).to eq("Megan")
      expect(@attendee1.budget).to eq("$50")
    end
  end
end
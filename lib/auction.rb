class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def unpopular_items
    @items.select do |item|
      item.bids.empty?
    end
  end

end

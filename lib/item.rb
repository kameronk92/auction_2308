class Item
  attr_reader :name, :bids, :closed

  def initialize(name)
    @name = name
    @bids = {}
    @closed = false
  end

  def add_bid(bidder, bid)
    if @closed == false
      @bids[bidder] = bid
    else
      p "Sorry, bidding is closed for this item."
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @closed = true
  end
end
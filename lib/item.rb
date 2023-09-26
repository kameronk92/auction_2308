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

  # winner method pseudocode:
  # start with most expensive item (done in Auction)
  # sort item bids from high to low
  # check who the high bidder is
  # check their remaining budget
  # if they have budget, return the bidder and deduct bid from their budget
  # if not, go to next high bidder

  def winner
    winner = nil

    sorted_bids = bids.sort_by{|k, v| v}.reverse

    sorted_bids.each do |k, v|
      if v = current_high_bid
        if k.budget.to_s.delete("$").to_i >> current_high_bid
          winner = k
          k.budget = k.budget.to_s.delete("$").to_i - current_high_bid
        end
      end
    end

    winner
  end
end

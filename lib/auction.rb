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

  def potential_revenue
    potential_revenue = 0

    @items.each do |item|
      if !item.bids.empty?
        potential_revenue += item.current_high_bid
      end
    end
    potential_revenue
  end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.each do |k, v|
        bidders << k.name
      end
    end
    bidders.uniq
  end

  def bidders_objects
    bidders_objects = []
    @items.each do |item|
      item.bids.each do |k, v|
        bidders_objects << k
      end
    end
    bidders_objects.uniq
  end

  def attendee_bid_on(attendee)
    attendee_items = []

    @items.each do |item|
      item.bids.each do |k, v|
        if k == attendee
          attendee_items << item
        end
      end
    end
    attendee_items
  end

  def bidder_info
    bidder_info = {}

    bidders_objects.each do |bidder|
      # require 'pry'; binding.pry
      bidder_info[bidder] = {
        budget: bidder.budget,
        items: attendee_bid_on(bidder)
      }
    end
    bidder_info
  end
end

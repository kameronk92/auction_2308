require "./spec/spec_helper"

RSpec.describe Attendee do
  describe "#initialize" do
    it "exists" do
      @attendee1 = Attendee.new({name: "Megan", budget: "$50"})
      expect(@attendee1).to be_an_instance_of(Attendee)
      expect(@attendee1.name).to eq("Megan")
      expect(@attendee1.budget).to eq("$50")
    end
  end
end

class Attendee
  attr_reader :name
  attr_accessor :budget

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget]
  end
end

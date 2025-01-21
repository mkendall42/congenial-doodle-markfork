class Carnival
  attr_reader :name, :duration, :rides, :total_revenue

  def initialize(name, duration)
    @name = name
    @duration = duration

    @rides = []
    @total_revenue = 0
  end

end

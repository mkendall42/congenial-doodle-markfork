class Carnival
  attr_reader :name, :duration, :rides, :total_revenue

  def initialize(name, duration)
    @name = name
    @duration = duration

    @rides = []
    @total_revenue = 0
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride()
    #Based on total NON-unique riders, so can utilize Ride's rider_log(s)
    #Nothing stated about handling ties, so just worry about returning first max
    @rides.max do |ride1, ride2|
      ride1.total_riders() <=> ride2.total_riders()
    end
  end

  def most_profitable_ride()
    @rides.max do |ride1, ride2|
      ride1.total_revenue <=> ride2.total_revenue
    end
  end

  def total_revenue()
    @rides.sum do |ride|
      ride.total_revenue
    end
  end
end

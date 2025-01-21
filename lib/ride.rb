class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log

  def initialize(ride_info_hash)
    @name = ride_info_hash[:name]
    @min_height = ride_info_hash[:min_height]
    @admission_fee = ride_info_hash[:admission_fee]
    @excitement = ride_info_hash[:excitement]

    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def board_rider(visitor)
    #First, check if heigh is ok and thrill level?

    rider_log[visitor] += 1
  end

  # def rider_log
  #   #Generate a hash with visitor as key and # of times ridden as value
  #   #Could just make in attr_reader really...
  # end

end

class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue

  def initialize(ride_info_hash)
    @name = ride_info_hash[:name]
    @min_height = ride_info_hash[:min_height]
    @admission_fee = ride_info_hash[:admission_fee]
    @excitement = ride_info_hash[:excitement]

    @total_revenue = 0
  end

end

class Visitor
  attr_reader :name, :height, :spending_money, :preferences

  def initialize(name, height, spending_money_string)
    @name = name
    @height = height
    @spending_money = spending_money_string.delete_prefix("$").to_i

    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(threshold_height)
    @height >= threshold_height
  end
  
  def pay_fee(amount)
    #Keep in weird "$[amount]" format I guess for now...
    #Return true if successful, false if insufficient funds
    if amount <= @spending_money
      @spending_money -= amount
      return true
    else
      return false
    end
  end

end

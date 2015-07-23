require_relative 'bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  
  attr_accessor :capacity 
  
  def initialize(capacity= DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    bikes.each_index do |b| 
      if bikes[b].working?
        return bikes.slice!(b)
      end
    end
     fail 'No bikes available' 
  end
  
  def dock bike
    fail 'Docking station full' if full?
    bikes << bike
  end
  
  private
  
  attr_accessor :bikes
  
  def full?
    bikes.count >= capacity
  end
  
  def empty?
    bikes.empty?
  end   
  
end

require_relative 'weather'

class Airport

  attr_reader :show_planes, :capacity

DEFAULT_CAPACITY = 4

  def initialize(capacity=DEFAULT_CAPACITY)
    @show_planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    @show_planes.length < capacity ? @show_planes.push(plane) : "There's no more space on the runway"
  end

  def plane_takeoff
    if @weather.weather == "STORMY"
      raise "Sorry, the weather is stormy"
    end
      @show_planes.pop()
  end

end

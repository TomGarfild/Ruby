require 'date'

class Train
  attr_accessor :destination, :number, :departure_time,
                :number_of_common_seats, :number_of_compartment_seats, :number_of_reserved_seats, :number_of_luxe_seats

  def initialize(destination, number, departure_time,
                 number_of_common_seats, number_of_compartment_seats, number_of_reserved_seats, number_of_luxe_seats)
    @destination = destination
    @number = number
    @departure_time = departure_time
    @number_of_common_seats = number_of_common_seats
    @number_of_compartment_seats = number_of_compartment_seats
    @number_of_reserved_seats = number_of_reserved_seats
    @number_of_luxe_seats = number_of_luxe_seats
  end

  def to_s
    "{destination=#{destination}, number=#{number}, departure_time=#{departure_time}, number_of_common_seats=#{number_of_common_seats}, number_of_compartment_seats=#{number_of_compartment_seats}, number_of_reserved_seats=#{number_of_reserved_seats}, number_of_luxe_seats=#{number_of_luxe_seats}}"
  end
end

def get_by_predicate(trains, &predicate)
  trains.each do |train|
    if predicate.call(train)
      puts train
    end
  end
end

def get_by_destination(trains, destination)
  get_by_predicate(trains) do |train|
    train.destination == destination
  end
end

def get_by_destination_after_time(trains, destination, time)
  get_by_predicate(trains) do |train|
    train.destination == destination && train.departure_time > time
  end
end

def get_by_destination_and_have_common_seats(trains, destination)
  get_by_predicate(trains) do |train|
    train.destination == destination && train.number_of_common_seats > 0
  end
end

trains = []

trains.push(Train.new("Kyiv", 35, DateTime.new(2022, 10, 20, 18, 0, 0), 60,60, 60, 60))
trains.push(Train.new("Kyiv", 70, DateTime.new(2022, 10, 20, 8, 30, 0), 0,60, 180, 0))
trains.push(Train.new("Lviv", 123, DateTime.new(2022, 10, 21, 5, 20, 0), 120,60, 60, 0))
trains.push(Train.new("Lviv", 69, DateTime.new(2022, 10, 23, 10, 30, 0), 30,30, 60, 120))
trains.push(Train.new("Zaporizhya", 37, DateTime.new(2022, 10, 21, 20, 50, 0), 0,40, 40, 40))
trains.push(Train.new("Zaporizhya", 38, DateTime.new(2022, 10, 23, 20, 50, 0), 30,40, 40, 40))

puts "Test get_by_destination"
get_by_destination(trains, "Kyiv")
puts "Test get_by_destination_after_time"
get_by_destination_after_time(trains, "Lviv", DateTime.new(2022, 10, 22, 0, 0, 0))
puts "Test get_by_destination_and_have_common_seats"
get_by_destination_and_have_common_seats(trains, "Zaporizhya")
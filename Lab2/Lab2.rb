def coordinates_formatter(str)
  return str.gsub(/[()]/, "").split(",").map {|s| Float(s)}
end

puts "Enter coordinates:"
input = gets.chomp

coordinates = input.split(" ").map do |c|
  coordinates_formatter(c)
end

area = 0

n = coordinates.size
(0...n).each { |index|
  area += coordinates[index][0] * coordinates[(index + 1) % n][1] - coordinates[index][1] * coordinates[(index + 1) % n][0]
}
area = area.abs / 2

puts area

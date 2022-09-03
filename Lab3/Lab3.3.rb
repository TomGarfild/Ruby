#4)
print "4) Enter n:"
n = Integer(gets.chomp)
res = 0
sin_sum = 0

for i in 1..n
  sin_sum += Math.sin(i)
  res += 1/sin_sum
end

puts res

#5)
print "5) Enter n:"
n = Integer(gets.chomp)

res = 0
n.times { res = Math.sqrt(2 + res) }
puts res
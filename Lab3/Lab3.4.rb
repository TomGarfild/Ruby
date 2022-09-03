def fact(n)
  (1..n).inject(:*) || 1.0
end

# ε = 0.00001
print "First: "
res = 0
(2..200).each do |n|
  res += (1.0/(n*n + n)**(n*n + n))
end

puts res

puts "Second: "
print "Enter x:"
x = Integer(gets.chomp)
puts 2/(Math.exp(x) - 1/Math.exp(x))
res = 1.0/x
(1..100).each do |n|
  res += 2.0*(2**(2*n)-1)*(n**(6/7))*((-1)**n)*(x**(2*n-1))/fact(2*n)
end
puts res

print "Third: "
res = 0
(1..55).each do |n|
  res += fact(3*n-2)/(fact(4*n)*5**(2*n)*2.0*n)
end

puts res
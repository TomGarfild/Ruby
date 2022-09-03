number = 333

i = 0
res = 0

until number == 0
  res += (number%2)*(10**i)
  number /= 2
  i += 1
end

puts res
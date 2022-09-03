number = 10101010101010

i = 0
res = 0

until number == 0
  res += (number%10)*(2**i)
  number /= 10
  i += 1
end

puts res
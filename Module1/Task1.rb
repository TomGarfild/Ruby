def f(x, a, b, c)
  if x < 3 && b != 0
    return a * x**2 - b * x + c
  elsif x > 3 && b == 0
    return (x - a) / (x - c)
  else
    return x / c
  end
end

def f_table(a, b, c, x_begin, x_end, dx)
  t = ~(a.to_i | b.to_i) & (a.to_i ^ c.to_i)
  puts t

  (x_begin..x_end).step(dx).each do |x|
    result = f(x, a, b, c)
    puts "f(#{x}) = #{t == 0 ? result.to_i : result}"
  end
end

puts "Test 1"
f_table(0, 0, 1, 3, 4, 0.5)

puts "Test 2"
f_table(0, 1, 1, 0, 2, 0.5)

puts"Enter a:"
a = gets.chomp.to_f
puts "Enter b:"
b = gets.chomp.to_f
puts "Enter c:"
c = gets.chomp.to_f

puts "Enter x_begin:"
x_begin = gets.chomp.to_f
puts "Enter x_end:"
x_end = gets.chomp.to_f
puts "Enter dx:"
dx = gets.chomp.to_f

f_table(a, b, c, x_begin, x_end, dx)
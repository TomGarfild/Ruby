print "Enter x:"
x = Float(gets.chomp)

def case1(x)
  puts "(abs(x-2)/(x^2 * cosx))^(1/7)"
  puts ((x-2).abs/((x**2)*Math.cos(x)))**(1.0/7.0)
end

def case2(x)
  puts "1/(tg(x+1/exp(x))/sin(x)^2)^(2/7)"
  puts 1/(Math.tan(x+1/Math.exp(x))/Math.sin(x)**2)**(2.0/7)
end

def case3(x)
  puts "1/(1+x/(1+x/(1+x)))"
  puts 1/(1+x/(1+x/(1+x)))
end

puts "case part"
case x
when -4..0
  if x != -4
    case1(x)
  end
when 0..12
  case2(x)
else
  case3(x)
end

puts "\nif part"

if x > -4 && x <= 0
  case1(x)
elsif x > 0 && x <= 12
  case2(x)
elsif x < -4 || x > 12
  case3(x)
end
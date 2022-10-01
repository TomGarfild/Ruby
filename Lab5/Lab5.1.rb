def prm(func, a, b, n)
  h = (b - a) / n.to_f
  sum = 0.0
  x = a + h / 2
  while x < b
    sum += func.call(x)
    x += h
  end
  sum * h
end

def trp(func, a, b, n)
  h = (b - a) / n.to_f
  sum = func.call(a) / 2 + func.call(b) / 2
  x = a + h
  while x <= b - h
    sum += func.call(x)
    x += h
  end
  sum * h
end

f1 = lambda { |x|
  2.0 / (1 - 4*x)
}

f2 = lambda { |x|
  Math.asin(Math.sqrt(x)) / Math.sqrt(x - x**2)
}
n = 2000

a1 = -2.2
b1 = -1.2

a2 = 0.2
b2 = 0.3

puts "Rectangular method for f1 = 2/(1-4x) (a = #{a1}, b = #{b1}) : #{prm(f1, a1, b1, n)}"
puts "Trapezoidal method for f1 = 2/(1-4x) (a = #{a1}, b = #{b1}) : #{trp(f1, a1, b1, n)}"
puts "Rectangular method for f2 = asin(sqrt(x))/sqrt(x(1-x)) (a = #{a2}, b = #{b2}) : #{prm(f2, a2, b2, n)}"
puts "Trapezoidal method for f2 = asin(sqrt(x))/sqrt(x(1-x))) (a = #{a2}, b = #{b2}) : #{trp(f2, a2, b2, n)}"
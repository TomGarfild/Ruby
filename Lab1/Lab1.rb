print "Enter x:"
x = Float(gets.chomp)
print "Enter t:"
t = Float(gets.chomp)
print "Enter z:"
z = Float(gets.chomp)

# In Wolfram Alpha
# e^tanx^2+sqrt(abs(t-z))/(cos(pi^2)^3 + e^pi*z^2) + 2.3*10^1.6
result = Math.exp(Math.tan(x)**2) + Math.sqrt((t-z).abs())/(Math.cos(Math::PI**2)**3 + Math.exp(Math::PI)*z**2) + 2.3*10**1.6

puts result
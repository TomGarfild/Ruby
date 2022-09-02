A = true
B = false
C = true
X = 50
Y = 10
Z = -5

puts "First part"

puts "a) NOT (#{A} OR #{B}) AND (#{A} && NOT #{B})"
puts !(A || B) && (A && !B)

puts "b) (#{Z} != #{Y}) AND (6 >= #{Y}) AND #{A} OR #{B} AND #{C} AND #{X} >= 1.5"
puts (Z != Y) && (6 >= Y) && A || B && C && X >= 1.5

puts "c) (8 - #{X}*2 <= #{Z}) AND (#{X}^2 >= #{Y}^2) OR (#{Z} >= 15)"
puts (8 - X*2 <= Z) &&  (X**2 >= Y**2) || (Z >= 15)

puts "d) #{X}>0 AND #{Y}<0 OR #{Z} >= (#{X}*#{Y}-(-#{Y}/#{X}))-(#{Z})/2"
puts X>0 && Y<0 || Z >= (X*Y-(-Y/X))+(-Z)/2

puts "e) NOT(#{A} OR #{B} AND NOT(#{C} OR (NOT #{A} OR #{B})))"
puts !(A||B&&!(C||(!A||B)))

puts "f)#{X}^2 + #{Y}^2 >= 1 AND #{X} >= 0 AND #{Y} >= 0"
puts X**2 + Y**2 >= 1 && X >= 0 && Y >= 0

puts "g)(#{A} AND (#{C} AND #{B} <> #{B} OR #{A}) OR #{C}) AND #{B}"
puts (A && (C && B ^ B || A) || C) && B

#2)
x = 4.5
P = true

puts "\nSecond part"
puts "NOT ((exp(#{x}*#{x})-sin(#{x}))<3.14) AND (#{P} OR NOT #{P})"
puts !((Math.exp(x*x)-Math.sin(x)) < 3.14) && (P || !P)
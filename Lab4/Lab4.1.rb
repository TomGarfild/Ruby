N = 12

A = Array.new(N) {rand(-2147483647...2147483648)}
B = Array.new(N) {rand(-2147483647...2147483648)}

print "A: #{A}"
puts
print "B: #{B}"
puts

bEven, bOdd, aEven, aOdd = [], [], [], []
(0...N).each { |i|
  if B[i] % 2 == 0
    bEven.push(B[i])
  else
    bOdd.push(B[i])
  end

  if A[i] % 2 == 0
    aEven.push(A[i])
  else
    aOdd.push(A[i])
  end
}

C = Array.new(2) { Array.new(N) }
C[0] = bEven + bOdd
C[1] = aOdd + aEven

puts "C:"
print "#{C[0]}\n#{C[1]}"
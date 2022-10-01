def evaluate_sum(func, x, n = 0)
  sum = 0
  eps = 0.001
  if n != 0
    (0..n).each do |i|
      sum += func.call(x, i)
    end
  else
    prev_sum = 1
    i = 0
    while (sum - prev_sum).abs > eps
      prev_sum = sum
      sum += func.call(x, i)
      i += 1
    end
  end

  sum
end

func = lambda { |x, i|
  Math.cos(2*i-1)*x/(2*i-1)**2
}

x = 0.1
n = 20

puts "Infinity sum : #{evaluate_sum(func, x)}"
puts "Sum to n = #{n} : #{evaluate_sum(func, x, n)}"
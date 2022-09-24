def generate_matrix(n)
  matrix = (0...n).map { Array.new(n, 2) }
  matrix.each_index do |i|
    matrix[i].each_index do |j|
      if i != j
        matrix[i][j] = 12
      end
    end
  end

  matrix
end

def generate_vector(n)
  (1..n).map {  |i| i }
end

def print_matrix(matrix)
  matrix.each do |row|
    row.each do |elem|
      print "#{elem}   "
    end
    puts
  end
end

def solve_gauss(matrix, vector)
  n = vector.length
  result = (0...n).map{ Array.new(n) }

  (0...n).each { |k|
    max = matrix[k][k].abs
    leading_index = k
    (k+1...n).each do |i|
      if matrix[i][k].abs > max
        max = matrix[i][k].abs
        leading_index = i
      end
    end

    (0...n).each do |j|
      matrix[leading_index][j], matrix[k][j] = matrix[k][j], matrix[leading_index][j]
    end

    vector[k], vector[leading_index] = vector[leading_index], vector[k]

    (k...n).each { |i|
      temp = matrix[i][k]
      (0...n).each do |j|
        matrix[i][j] = matrix[i][j].to_f / temp
      end

      vector[i] = vector[i].to_f / temp

      if i == k
        next
      end

      (0...n).each do |j|
        matrix[i][j] -= matrix[k][j]
      end

      vector[i] -= vector[k]
    }
  }

  (n - 1).downto(0) do |k|
    result[k] = vector[k]
    (0..k).each do |i|
      vector[i] = vector[i] - matrix[i][k] * result[k];
    end
  end

  result
end

print "Enter n:"
n = (Integer(gets.chomp)-3)%7+3
puts "n: #{n}"
A = generate_matrix(n)
b = generate_vector(n)

puts "A: "
print_matrix(A)
puts "b: "
puts b
puts "X: "
print solve_gauss(A, b)
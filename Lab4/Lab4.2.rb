require 'matrix'

def generate_matrix(n, m)
  Matrix.build(n, m) { rand(10) }
end

def print_matrix(matrix)
  (0...matrix.row_count).each { |i|
    (0...matrix.column_count).each { |j|
      print matrix[i, j].to_s + " "
    }
    puts
  }
end

def multiply(matrix1, matrix2)
  Matrix.build(matrix1.row_count, matrix2.column_count) do |vector_i, vector_j|
    current = 0
    (0...matrix1.column_count).each { |i|
      current += matrix1[vector_i, i] * matrix2[i, vector_j]
    }
    current
  end
end

n = 8
Y = generate_matrix(1, n)
B = generate_matrix(n, n)

puts "Vector Y: "
print_matrix(Y)

puts "Matrix B:"
print_matrix(B)

puts "Result of Y*B: "
print_matrix(multiply(Y, B))

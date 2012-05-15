up_to = 100

# Calculate the sum of the squares of each number from 1 to up_to
sum_of_squares = (1..up_to).inject {|memo, i| memo += i * i }

# Sum up the numbers from 1 to up_to and square the sum
sum = (1..up_to).reduce(:+)
square_of_sum = sum * sum

puts "Sum of squares: " + sum_of_squares.to_s
puts "Square of sum: " + square_of_sum.to_s
puts "\nDiff: " + (square_of_sum - sum_of_squares).to_s
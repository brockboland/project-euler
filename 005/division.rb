# Find the lowest factor of all numbers up to max_divisor
def find_min_factor(max_divisor)
  # Start with the max_divisor (after all, numbers smaller than max_divisor
  # can't be evenly divisible by max_divisor
  counter = max_divisor;
  while !check_factor(counter, max_divisor)
    # Increment the number to check by the max_divisor, since the answer will
    # have to be an even multiple of max_divisor
    counter += max_divisor
  end
  counter
end

# Check if factor is evenly divisible by all positive integers up to and
# including max_divisor
def check_factor(factor, max_divisor)
  is_factor = true
  # Start looping high, since higher numbers are less likely to be factors, so
  # the loop can bail out early if the highest number isn't a factor
  # Only loop down to 2, since everything is divisible by 1
  max_divisor.downto(2).each { |i|
    # Determine factor is evenly divisble by 1
    is_factor = is_factor && (factor % i == 0)
    # If factor is not evenly divisible by i, don't bother checking lower nums
    break if !is_factor
  }
  # Return whether or not it's a factor
  is_factor
end



# Start timing so we can check run time
begin_time = Time.now

# Find the lowest factor
num_to_check = 20
puts "\n\nLowest factor of " + num_to_check.to_s + ':'
puts find_min_factor(num_to_check)

puts "\n\nRun time: " + (Time.now - begin_time).to_s + " seconds\n\n"
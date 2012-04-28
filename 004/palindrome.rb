begin_time= Time.now

# How many digits to include in the numbers being multiplied
digits = 4

class Product
  attr_accessor :num1, :num2, :product
  
  def initialize(num1, num2)
    @num1 = num1
    @num2 = num2
    @product = num1 * num2
  end
  
  def isPalindrome
    prod_string = @product.to_s

    if (prod_string.length % 2 == 0)
      # Length is an even number of digits: split in half
      half_length = prod_string.length / 2
      first_half = prod_string[0..half_length-1]
      second_half = prod_string[half_length..-1]
    else
      # Length is odd number of digits: ignore middle digit
      half_length = (prod_string.length / 2).round
      first_half = prod_string[0..half_length-1]
      second_half = prod_string[half_length+1..-1]
    end

    # Check if the front half matches the back half
    first_half == second_half.reverse
  end
end


low = 10 ** (digits-1)
high = ''
digits.times{ high += '9' }
high = Integer(high)

max_palindrome = 0
max_factors = []

(low..high).each do |num1|
  (low..high).each do |num2|
    p = Product.new(num1, num2)
    if (p.isPalindrome())
      puts p.num1.to_s + 'x' + p.num2.to_s + " =\t\t" + p.product.to_s
      if (p.product > max_palindrome)
        max_palindrome = p.product
        max_factors = [num1, num2]
      end
    end
  end
end

puts "\n"
puts 'Max palindrome: ' + max_palindrome.to_s
puts '(product of ' + max_factors[0].to_s + 'x' + max_factors[1].to_s + ')'

puts 'Run time: ' + (Time.now - begin_time).to_s + ' seconds'
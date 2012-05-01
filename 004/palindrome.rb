begin_time= Time.now

# How many digits to include in the numbers being multiplied
digits = 3

class Product
  attr_accessor :num1, :num2, :product
  
  def initialize(num1, num2)
    @num1 = num1
    @num2 = num2
    @product = num1 * num2
  end
  
  def isPalindrome
    @product.to_s == @product.to_s.reverse
  end
end

# Determine the high and low numbers based on the number of digits
low = 10 ** (digits-1)
high = (10 ** digits) - 1

max_palindrome = 0
max_factors = []

(low..high).each do |num1|
  (low..high).each do |num2|
    if ((p = Product.new(num1, num2)).isPalindrome())
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
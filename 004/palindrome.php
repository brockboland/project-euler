<?php
$begin_time = microtime(TRUE);

$digits = 4;

$low = '1';
$high = '9';
for($i = 1; $i < $digits; $i++) {
  $low .= '0';
  $high .= '9';
}
$low = (int)$low;
$high = (int)$high;

echo "Low: $low\n";
echo "High: $high\n";

$max_palindrome = 0;
$max_factors = array();

for($num1 = $low; $num1 <= $high; $num1++) {
  for($num2 = $low; $num2 <= $high; $num2++) {
    $product = $num1 * $num2;
    echo "$num1 x $num2 = $product\n";
    
    if ($product == strrev($product)) {
      echo "$num1 x $num2 =\t\t$product\n";
      if ($product > $max_palindrome) {
        $max_palindrome = $product;
        $max_factors = array($num1, $num2);
      }
    }
  }
}



echo "\n";
echo "Max palindrome: $max_palindrome\n";
echo "(product of " . $max_factors[0] . 'x' . $max_factors[1] . ")\n";

echo "Run time: " . (microtime(TRUE) - $begin_time) . " seconds\n";

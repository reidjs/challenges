#!/bin/ruby

def birthdayCakeCandles(n, ar)
    # Complete this function
    ar.count(ar.max)
end

#n = gets.strip.to_i
#ar = gets.strip
#ar = ar.split(' ').map(&:to_i)
n = 4
ar = [3, 2, 1, 3]
result = birthdayCakeCandles(n, ar)
puts result;

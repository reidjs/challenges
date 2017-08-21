# # Given five positive integers, find the minimum and maximum values that can be
#  calculated by summing exactly four of the five integers. Then print the
#   respective minimum and maximum values as a single line of two space-separated
#   long integers.
# #
# # Input Format
# #
# # A single line of five space-separated integers.
# #
# # Constraints
# #
# # Each integer is in the inclusive range .
# # Output Format
# #
# # Print two space-separated long integers denoting the respective
# minimum and maximum values that can be calculated by summing exactly
# four of the five integers. (The output can be greater than 32 bit integer.)

arr = gets.strip
arr = arr.split(' ').map(&:to_i)
sums = []
for i in 0..arr.length-1
 sums << (arr[0,i] + arr[i+1,arr.length]).inject{|sum, e| sum+=e}
end
print sums.min, " ", sums.max

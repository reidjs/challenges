# Given a time in -hour AM/PM format, convert it to military (-hour) time.
#
# Note: Midnight is  on a -hour clock, and  on a -hour clock. Noon is  on a -hour clock, and  on a -hour clock.
#
# Input Format
#
# A single string containing a time in -hour clock format (i.e.:  or ), where  and .
#
# Output Format
#
# Convert and print the given time in -hour format, where .
#
# Sample Input
#
# 07:05:45PM
# Sample Output
#
# 19:05:45

def timeConversion(s)
  s = s.chars
  ampm = [s.pop, s.pop].reverse
  if (ampm[0] + ampm[1]) == "PM"
    hh = ((s.shift + s.shift).to_i + 12).to_s.chars
    if hh == ["2", "4"]
      hh = ["1", "2"]
    end
    s.unshift(hh[0], hh[1])
  elsif (s[0] == "1" && s[1] == "2")
    hh = ((s.shift + s.shift).to_i).to_s.chars
    s.unshift(0,0)
  end
  s.join('')
end

#s = gets.strip
s = "12:00:45PM"
result = timeConversion(s)
puts result;

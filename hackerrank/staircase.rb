n = gets.strip.to_i
spaces = n-1
hashes = 1
i = 0
while hashes <= n
  str = ""
  spaces.times do str += " " end
  hashes.times do str += "#" end
  puts str
  spaces-=1
  hashes+=1
end

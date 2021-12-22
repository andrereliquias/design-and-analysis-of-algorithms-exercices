#!/usr/bin/ruby

input_size = gets.strip.to_i
for i in 1..input_size do
  input = gets.strip
  input.gsub!(/\./, '') if input.include? "."

  count = 0
  while input.include? "<>"
    input.slice! "<>"
    count += 1
  end

  puts count
end
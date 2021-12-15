#!/usr/bin/ruby
input = $stdin.read.split("\n").drop 1
output = String.new

input.each_slice(2) do |element|
  table = Array.new(element[0].split[0].to_i) { [] }
  
  element[1].split.each_with_index do |num, index|
    res = num.to_i % element[0].to_i
    table[res].push(num)
  end

  table.each_with_index { |values, index|
    output << "#{index} -> #{values.join(" -> ") + " -> " if !values.empty?}\\\n"
  }
  output << "\n"
end

puts output[0...-2]
#!/usr/bin/ruby
input = $stdin.read.split("\n")
total = input.shift
aux = 1

input.each do |item|
  break if aux.eql? total or item.length > 1000

  if item.include? "."
    string = item.gsub!(/\./, '')
  else 
    string = item
  end

  next if item.nil? or string.nil?
  
  count = 0
  while string.include? "<>"
    string.slice! "<>"
    count += 1
  end

  puts "#{count}\n"
end
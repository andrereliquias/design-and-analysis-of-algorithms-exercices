#!/usr/bin/ruby
input = $stdin.read.split("\n").drop(1).reject { |elem| elem.empty? }

input.each do |item|
  string = item.gsub!(/\./, '')
  next if item.nil? or string.nil?
  
  count = 0
  while string.include? "<>"
    string.slice! "<>"
    count += 1
  end

  puts "#{count}\n"
end
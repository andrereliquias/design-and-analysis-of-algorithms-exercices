#!/usr/bin/ruby
input = $stdin.read.split("\n")

aux = 0
total_numbers = 0
mod_of = 0
map_hash = Hash.new

input.each_with_index do |item, index|
  item = item.split.map { |num| num.to_i }
  old_item = item if index.eql? 0
  
  if (aux - 1).eql?(total_numbers) or total_numbers.eql? 0
    total_numbers, mod_of = item
    map_hash = map_hash.sort.to_h

    map_hash.each do |key, value|
      pares = Array.new
      impares = Array.new

      value.each do |item|
        if (item % 2).eql? 0
          pares << item
        else
          impares << item
        end
      end

      puts impares.sort.reverse
      puts pares.sort
    end

    puts item.join(" ")
    
    if item.eql? "0 0"
      puts item
      break
    end

    map_hash = Hash.new

    aux = 1
  else
    number = item.first
    if number > 0
      mod_res = number % mod_of
    else
      mod_res = number.remainder(mod_of)
    end

    if !map_hash.key? mod_res
      map_hash.merge!( Hash[mod_res, [number]] )
    else
      map_hash[mod_res].push(number)
    end

    aux += 1
  end
end

#!/usr/bin/ruby
input = $stdin.read.split("\n")

aux = 0
total_cars = 0
total_spots = 0
parking_lot = Array.new

input.each_with_index do |item, index|
  item = item.split.map {|num| num.to_i }
  
  if (aux - 1).eql?(total_cars) or total_cars.eql? 0
    total_cars, total_spots = item

    if !parking_lot.empty? 
      while !parking_lot.empty? 
        if parking_lot.length.eql? 1 or
        (parking_lot.last[1] < parking_lot[0...-1].last[1]) or 
        (parking_lot[0...-1].last[1].eql? parking_lot.last[0])
          parking_lot = parking_lot.tap(&:pop)
        else
          break
        end
      end

      if parking_lot.empty?
        puts "Sim"
      else
        puts "Nao"
      end
    elsif item.eql? [0, 0]
      break
    end
    
    parking_lot.clear
    aux = 1
  else
    drive_in, drive_out = item

    if parking_lot.empty?
      parking_lot << item
    elsif parking_lot.length <= total_spots 
      if drive_in > parking_lot.last[1]
        parking_lot = parking_lot.tap(&:pop)
        parking_lot << item
              else drive_out < parking_lot.last[1]
        parking_lot << item
      end
    end
    aux += 1
  end
end

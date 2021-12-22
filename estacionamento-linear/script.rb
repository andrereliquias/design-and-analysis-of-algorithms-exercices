#!/usr/bin/ruby
input = $stdin.read.split("\n")

aux = 0
total_cars = 0
total_spots = 0
parking_lot = Array.new
old_total_spots = 0 
can_proceed = true

input.each_with_index do |item, index|
  item = item.split.map {|num| num.to_i }
  
  if (aux - 1).eql?(total_cars) or total_cars.eql? 0
    old_total_spots = total_spots
    total_cars, total_spots = item
    
    if !parking_lot.empty? and can_proceed
      while !parking_lot.empty? and (parking_lot.length <= old_total_spots)
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
    can_proceed = true
    aux = 1
  else
    drive_in, drive_out = item

    if parking_lot.empty? and can_proceed
      parking_lot << item
    elsif (parking_lot.length <= total_spots) and can_proceed
      if drive_in >= parking_lot.last[1]
        items_to_remove = Array.new
        
        parking_lot.each do |obj|
          if drive_in >= obj[1] 
            items_to_remove << obj 
          end
        end

        items_to_remove.each do |car|
          parking_lot.each do |rmv|
      
            if car[0] == rmv[0] and car[1] == rmv[1]
        
              parking_lot.delete(car)
            end
          end
        end
  
        parking_lot << item
      elsif drive_out < parking_lot.last[1]
        parking_lot << item
      else
        can_proceed = false
        puts "Nao"
      end
    end
    aux += 1
  end
end

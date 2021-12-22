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
    # puts "bateu em cima"
    
    # puts "Quantidade de carros que o atual partkin lot suporta :#{old_total_spots}"
    # if old_total_spots 
    # puts "Quantiade de carros que supostamente estariam la: #{parking_lot.length}"
    if !parking_lot.empty? and can_proceed
      while !parking_lot.empty? and (parking_lot.length <= old_total_spots)
        if parking_lot.length.eql? 1 or
        (parking_lot.last[1] < parking_lot[0...-1].last[1]) or 
        (parking_lot[0...-1].last[1].eql? parking_lot.last[0])
          # puts " antes do pop --- #{parking_lot}----"
          parking_lot = parking_lot.tap(&:pop)
          # puts " depois do pop --- #{parking_lot}----"
        else
          # puts "Nao ta vazio "
          # puts "--- #{parking_lot}----"
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

    # puts "TOTAL DE VAGAS NA GARAGEM: #{total_spots}"
    # puts "TAMANHO DA GARAGEM OCUPADA: #{parking_lot.length}"
    
    if parking_lot.empty? and can_proceed
      # puts "Garagem ta vazia, so vou colocar"
      parking_lot << item
    elsif (parking_lot.length <= total_spots) and can_proceed
      # puts "oq vai entrar agora ele vai entrar depois que o ultimo sair?"
      # puts "drive_in > parking_lot.last[1] #{drive_in >= parking_lot.last[1]}"
      if drive_in >= parking_lot.last[1]
        # parking_lot = parking_lot.tap(&:pop)

        items_to_remove = Array.new
        parking_lot.each do |obj|
          # puts "Analizando se #{obj} eh menor q #{drive_in}"
          if drive_in >= obj[1] 
            # puts "partkinlot: #{parking_lot}"
            # puts "preciso remover: #{obj}"
            items_to_remove << obj 
            # puts "depois de remover remover: #{parking_lot}"
          end
        end # if parking_lot.length >= 2

        # puts "Vou remover tudo isso aq"
        # pp items_to_remove
        # puts "ante : #{parking_lot}"
        items_to_remove.each do |car|
          parking_lot.each do |rmv|
            # puts "To vendo se #{car} eh igual #{rmv}"
            if car[0] == rmv[0] and car[1] == rmv[1]
              # puts "#{car} deu igual #{rmv}"
              parking_lot.delete(car)
            end
          end
        end
        # puts "asdijknnjasjhndsajdasujdsa"
        # pp items_to_remove
        # puts "asdijknnjasjhndsajdasujdsa"

        # puts "depois : #{parking_lot}"

        # puts "sim? entao tira o utimo e coloca ele"
        parking_lot << item

      elsif drive_out < parking_lot.last[1]
        # puts "entao ele vai sair primeiro?"
        # puts "#{drive_out < parking_lot.last[1]}"

        parking_lot << item
      else
        # puts "Vai dar ruim, mas deixa rolar"
        can_proceed = false
        puts "Nao"
      end

      # parking_lot.each do |item|
      #   if drive_in > parking_lot.last[1]
      #     parking_lot = parking_lot.tap(&:pop)
      #     parking_lot << item
      #   else 
      #     drive_out < parking_lot.last[1]
      #     parking_lot << item
      #   end
      # end
    end
    aux += 1
  end
end

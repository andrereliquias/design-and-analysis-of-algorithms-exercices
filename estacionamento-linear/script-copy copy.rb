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
    # puts "Nova leva de calculo aux:#{aux} total_cars:#{total_cars} ==========="

    puts "bateu em cima"
    if !parking_lot.empty? 
      while !parking_lot.empty? 
        if parking_lot.length.eql? 1 or
        (parking_lot.last[1] < parking_lot[0...-1].last[1]) or 
        (parking_lot[0...-1].last[1].eql? parking_lot.last[0])
          puts " antes do pop --- #{parking_lot}----"
          parking_lot = parking_lot.tap(&:pop)
          puts " depois do pop --- #{parking_lot}----"
        else
          puts "Nao ta vazio "
          puts "--- #{parking_lot}----"
          break
        end
      end

      if parking_lot.empty?
        puts "Sim"
      else
        puts "Nao"
      end

      # if parking_lot.last.join(" ").eql? input[index - 1]
      #   puts "sim"
      # else
      #   while !parking_lot.empty? 
          
      #   end
      # end

    elsif item.eql? [0, 0]
      break
    else
      puts "Nao"
    end
    
    parking_lot.clear
    aux = 1
  else
    drive_in, drive_out = item

    puts "TAMANHO DA GARAGEM OCUPADA: #{parking_lot.length}"
    puts "TOTAL DE VAGAS NA GARAGEM: #{total_spots}"
    if parking_lot.empty?
      parking_lot << item
    elsif parking_lot.length <= total_spots
      # oq vai entrar agora ele vai entrar depois que o ultimo sair?
      if drive_in > parking_lot.last[1]
        # sim? entao tira o utimo e coloca ele
        parking_lot = parking_lot.tap(&:pop)
        parking_lot << item
        
        # entao ele vai sair primeiro?
      elsif drive_out < parking_lot.last[1]
        # sim? entao ele pode entrar
        # puts "O ultimo vai sair as #{parking_lot.last[1]} e eu saio as #{drive_out}"
        parking_lot << item
        # pp item
        # pp parking_lot
      end

      # last_drive_in = parking_lot.last[0]
      # last_drive_out = parking_lot.last[1]

      # if parking_lot.length <= total_spots and
      # (drive_out < last_drive_out or 
      # drive_in > last_drive_out)
      #   puts "parking_lot.length #{parking_lot.length} < total_spots #{total_spots} | #{parking_lot.length < total_spots}"
      #   puts "drive_out #{drive_out} < last_drive_out #{last_drive_out}| #{drive_out < last_drive_out}"
      #   puts "drive_in #{drive_in} > last_drive_out #{last_drive_out} | #{drive_in > last_drive_out}"
      #   parking_lot << item
      # end
    end

    # puts "#{aux} Motorista - Entrada: #{drive_in} | Saida: #{drive_out}\n"
    # puts "Estacionamento: #{parking_lot}"
    aux += 1
  end
end

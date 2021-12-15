input = $stdin.read.split("\n")

input.each do |item|
  item.gsub!(/[^\(|\)]*/, '')

  while item.include? "()"
    item.slice! "()"
  end

  puts item.empty? ? "correct" : "incorrect"
end
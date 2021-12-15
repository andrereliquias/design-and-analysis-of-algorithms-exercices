#!/usr/bin/ruby

res = Array.new
dictionary = Hash.new

input = $stdin.read.scan(/\d+|\D+/)

array_languages = input[1].split("\n").drop 1
array_students = input[3].split("\n").drop 1

array_languages.each_slice(2) { |element|
  dictionary.merge! Hash[element[0], element[1]]
}

students_count = 0

array_students.each_slice(2) { |element|
  translation = dictionary[element[1]]
  res << element[0] + "\n" << translation + "\n\n"
}

puts res.join
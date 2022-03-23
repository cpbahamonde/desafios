# reemplazar la instrucción while por times
=begin 
i = 0
while i < 50
puts "Iteración #{i}"
i = i + 1
end
puts 
=end

50.times do |i|
puts "Iteración #{i}"
end

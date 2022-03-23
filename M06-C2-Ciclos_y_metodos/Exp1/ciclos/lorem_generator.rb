# programa capaz de mostrar en pantalla varios párrafos de Lorem ipsum, 
# donde el número de párrafos se especifica al cargar el script. 
# Uso:
# ruby lorem_generator.rb
# Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac...

puts "Cuantos parrafos LoremIpsum desea?"
num_ingr = gets.to_i
i=1
parrafo="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac
lacinia nibh, nec faucibus"
while i <= num_ingr
    puts
    puts "#{parrafo}"
    i += 1
end

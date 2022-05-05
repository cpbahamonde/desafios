# Programa que recibe por consola la cant de caracteres y muestra el sgte
# Patrón3
# ruby patron3.rb 15
# 121212121212121

num_ingr = ARGV[0].to_i
num_ingr.times do |i|
    if i%2==0
        print '1'
    else
        print '2'
    end
end

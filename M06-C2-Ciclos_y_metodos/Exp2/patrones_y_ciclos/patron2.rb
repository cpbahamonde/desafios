# Programa que recibe por consola la cant de caracteres y muestra el sgte
# Patrón2
# ruby patron2.rb 10
# **..**..**

num_ingr = ARGV[0].to_i
num_ingr.times do |i|
    if i%2==0
        print '**'
    else
        print '..'
    end
end



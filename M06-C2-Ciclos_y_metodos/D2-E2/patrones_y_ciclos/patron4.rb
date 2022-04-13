# Programa que recibe por consola la cant de caracteres y muestra el sgte
# Patrón4
# ruby patron4.rb 18
# 123123123123123123

num_ingr = ARGV[0].to_i
num_ingr.times do |i|
    if i%3==0
        print '1'
    elsif
        i%3==1
        print '2'
    else
        print '3'
    end
end

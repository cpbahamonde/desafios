# Programa donde se suman únicamente los números pares dentro del ciclo entre 0 
# y un número ingresado por el usuario al momento de cargar el programa.
# Uso:
# pares.rb 100
# 2550

num_ingr = ARGV[0].to_i
i=0
s=0
while i <= num_ingr
    if(i % 2 == 0 )
        s += i
    end
    i += 1
end
 puts " #{s}"
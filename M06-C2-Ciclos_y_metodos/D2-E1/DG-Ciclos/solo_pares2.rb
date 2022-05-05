# muestre los primeros n números pares, donde n es ingresado por el usuario.
# en este caso el cero no es considerado (el cero no es par).
# Uso:
# ruby solo_pares2.rb 10
# 2 4 6 8 10

num_ingr = ARGV[0].to_i
i=1

while i <= num_ingr
    if(i % 2 == 0 )
        print " #{i}"
    end
    i = i + 1
end
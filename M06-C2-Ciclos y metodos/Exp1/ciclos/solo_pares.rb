# muestre los primeros n números pares,
# donde n es ingresado por el usuario.
# Uso:
# ruby solo_pares.rb 10
# 0 2 4 6 8 10

num_ingr = ARGV[0].to_i
i=0

while i <= num_ingr
    if(i % 2 == 0 )
        print " #{i}"
    end
    i = i + 1
end
# muestre los primeros n números impares,
# donde n es ingresado por el usuario.
# Uso:
# ruby solo_impares.rb 10
# 1 3 5 7 9

num_ingr = ARGV[0].to_i
i=0

while i <= num_ingr
    if(i % 2 != 0 )
        print " #{i}"
    end
    i = i + 1
end
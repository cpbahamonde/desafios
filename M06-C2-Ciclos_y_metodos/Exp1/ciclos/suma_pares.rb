# sume los primeros n números pares, donde n es ingresado por el usuario por línea de comandos.
# Tip: El cero no es par, no afecta en la suma pero tenemos que tener cuidado con los bordes del ciclo.
# Uso:
# ruby suma_pares.rb 20
# *420* <= la suma de los pares hasta 20 NO da 420
# 110   <= la suma de los pares hasta 20 da 110

num_ingr = ARGV[0].to_i
i=1
s=0
while i <= num_ingr
    if(i % 2 == 0 )
        s += i
    end
    i += 1
end
 puts " #{s}"
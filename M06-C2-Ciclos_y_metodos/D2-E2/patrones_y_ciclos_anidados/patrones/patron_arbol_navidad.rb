# Programa con métodos que reciben la cantidad de líneas y
# muestran por pantalla el siguiente patron de *:
# 
# f. Método navidad(n)
#    *
#   * *
#  * * *
# * * * *
#    *
#  * * *

 def patron(num)                                # Inicio Metodo

            filas= (num/3)+2
            b=(num/3)+1
            xb=(num/num)                                   
            filas.times do |i|                  # Inicio bloque central 
                puts " "*(b) + "* "*(xb) 
                b=b-1
                xb=xb + 1
            end                                 # Fin bloque central 

    puts " "*(num/3+1) + "* "                   # Lineas inferiores 
    puts " "*(num/3-1) + "* "*3           

end                                             # Fin Metodo

num_ingr=ARGV[0].to_i
if (num_ingr >= 3 ) && (num_ingr % 3 == 0 )             # Valida multiplo de 3
    system 'clear'
    puts "Arbol Navidad de dimension [#{num_ingr}]"     # Msg Titulo
    puts 
    patron(num_ingr)                                    # Llama a Metodo
else                                                    # Msg Error
    puts "[ #{num_ingr} ] Argumento Invalido: Debe ser numero entero multiplo de 3."  
end


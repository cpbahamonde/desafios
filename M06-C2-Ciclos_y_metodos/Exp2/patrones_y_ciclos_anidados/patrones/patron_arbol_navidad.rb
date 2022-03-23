puts "
Estimados, 

estudie muchos tipos de arboles y triangulos (vertical, horizontal, invertido, etc)
pero no hubo caso de formar el patron, logre hacer varios tipos de arboles, sin embargo cuando 
intentaba ingresar el 'espacio en blanco' , se me desarmaba todo, a esas alturas
ya tenia la cabeza caliente y me estaba atrasando en los otros desafios.

Podria haber hecho el patron con un solo numero (ej.5), lo que si me funciono, 
pero me gusta hacer el codigo para cualquier numero (y esto fue lo que no logre) 

De antemano les ofrezco las disculpas correspondientes y de paso, les agradeceria
me enviaran la solucion.
 
PD.: el codigo posterior esta inservible


saludos,
Claudio Bahamonde
"








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


# def patron(num_ingr)                                # Inicio Metodo

    #    filas= (num_ingr/3)+1
    # puts "filas #{filas}"
    # poscs= (num_ingr/3)+2 
    # #  puts "poscs #{poscs}"
    # p_indv= ((num_ingr/3)+1)*2+1 
    #  puts "posc indv #{p_indv}"
    # puts "-"*((num_ingr/3)+1) + "*" + "-"*((num_ingr/3)+1)              # Linea Superior

      
    #  filas.times do |i|  
            
    #             print "-"*(num_ingr/3)+"*" +"-"+ "*"+"-"*(num_ingr/3)
               
                
    #         end
           
    #  puts
        
    
    
    # # Fin bloque central  
    # puts "-"*((num_ingr/3)+1) + "*" + "-"*((num_ingr/3)+1)                     # Lineas inferiores 
    # puts "-"*(num_ingr/3) + "***" + "-"*(num_ingr/3)            


# n = num_ingr # Set number of rows
# i = 1

# num_ingr.times() do
#   print ' ' * n 
#   print '*' * (2 * i - 1 )
#   print ' ' * n
#   print "\n"

#   n -= 1
#   i += 1
# end


# end                                                 # Fin Metodo

# num_ingr=ARGV[0].to_i
# if (num_ingr >= 3 ) && (num_ingr % 3 == 0 )                                  # Valida numero > 3
#     system 'clear'
#     puts "Arbol Navidad de dimension [#{num_ingr}]"        # Msg Titulo
#     puts 
#     patron(num_ingr)                                    # Llama a Metodo
# else                                                # Msg Error
#     puts "[ #{num_ingr} ] Argumento Invalido: Debe ser numero entero multiplo de 3."  
# end


    # (num_ingr).times do |i|
    #         i.times do |j|
    #         print "* "  
    #         j-=1
    #     end
    #     puts
    # end
# Programa con métodos que reciben la cantidad de líneas y
# muestran por pantalla el siguiente patron de *:
#
# a. Método letra_o(n)            
# *****                           
# *   *                           
# *   *                             
# *   *                             
# *****                           

def patron(num_ingr)                                            # Inicio Metodo
    puts "*" * num_ingr                                         # Linea Superior
     (num_ingr-2).times do                                      # Inicio Bloque Central
             puts "*" + (" "*(num_ingr-2)) + "*"
     end                                                        # Fin Bloque Central
     puts "*" * num_ingr                                        # Linea inferior
end                                                             # Inicio Metodo


num_ingr=ARGV[0].to_i
if(num_ingr >= 3 )                                             # Valida numero > 3
    system 'clear'
    puts "Letra O de dimension [#{num_ingr}]"                   # Msg Titulo
    puts 
    patron(num_ingr)                                           # Llama a Metodo
else                                                            # Msg Error
    puts "[ #{num_ingr} ] Argumento Invalido: Debe ser numero superior a 3."  
end


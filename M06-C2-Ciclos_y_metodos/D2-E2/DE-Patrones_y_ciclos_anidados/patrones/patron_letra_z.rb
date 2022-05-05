# Programa con métodos que reciben la cantidad de líneas y
# muestran por pantalla el siguiente patron de *:
#
# c. Método letra_z(n)            
# n = 5                           
# *****                           
#    *                            
#   *                               
#  *                              
# *****        

def patron(num_ingr)                                # Inicio Metodo
    puts "*" * num_ingr                             # Linea Superior 
    (num_ingr-2).times do |i|                       # Inicio Bloque Central
        puts " "*(num_ingr-2-i) + "*"
    end                                             # Fin Bloque Central
    puts "*" * num_ingr                             # Linea Inferior                             
end

num_ingr=ARGV[0].to_i
if(num_ingr >= 3 )                                  # Valida > 3
    system 'clear'
    puts "Letra Z de dimension [#{num_ingr}]"       # Msg Titulo
    puts 
    patron(num_ingr)                                # Llama a Metodo
else                                                # Msg Error
    puts "[ #{num_ingr} ] Argumento Invalido: Debe ser numero superior a 3."  
end


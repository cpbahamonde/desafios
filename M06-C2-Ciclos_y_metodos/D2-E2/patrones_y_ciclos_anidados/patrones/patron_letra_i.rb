# Programa con métodos que reciben la cantidad de líneas y
# muestran por pantalla el siguiente patron de *:
#        
# b. Método letra_i(n)
# n = 5
# *****  
#   *
#   *
# *****   

def patron(num_ingr)                               # Inicio Metodo
    puts "*" * num_ingr                             # Linea Superior 
    (num_ingr-2).times do                           # Inicio Bloque Central
        puts " " * (num_ingr/2) + "*"
    end                                             # Fin Bloque Central
    puts "*" * num_ingr                             # Linea Inferior                             
end

num_ingr=ARGV[0].to_i
if(num_ingr >= 3 ) && (num_ingr % 2 != 0 )              # Valida Impar & > 3
    system 'clear'
    puts "Letra I de dimension [#{num_ingr}]"           # Msg Titulo
    puts 
    patron(num_ingr)                                    # Llama a Metodo
else                                                    # Msg Error
    puts "[ #{num_ingr} ] Argumento Invalido: Debe ser numero impar superior a 3."  
end



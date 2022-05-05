# Programa con métodos que reciben la cantidad de líneas y
# muestran por pantalla el siguiente patron de *:
#
# e. Método numero_cero(n)
# n = 5
# *****
# **  *
# * * *
# *  **
# *****

def patron(num_ingr)                                # Inicio Metodo
    puts " " + "*"*(num_ingr-2) + " "               # Linea Superior
    b=0                                             
    a=0
    c=num_ingr-3
    (num_ingr-2).times do                           # Inicio bloque central
        puts "*" +" "*b + "*" + " "*c  +"*" 
        a+=1
        b+=1
        c-=1
    end                                                 # Fin bloque central   
    puts " " + "*"*(num_ingr-2) + " "                   # Linea inferior
end                                                 # Fin Metodo

num_ingr=ARGV[0].to_i
if(num_ingr >= 4 )                                  # Valida numero > 3
    system 'clear'
    puts "Numero '0' de dimension [#{num_ingr}]"        # Msg Titulo
    puts 
    patron(num_ingr)                                    # Llama a Metodo
else                                                # Msg Error
    puts "[ #{num_ingr} ] Argumento Invalido: Debe ser numero superior a 4."  
end

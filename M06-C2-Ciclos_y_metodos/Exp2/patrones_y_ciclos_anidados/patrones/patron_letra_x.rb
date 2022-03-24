# Programa con métodos que reciben la cantidad de líneas y
# muestran por pantalla el siguiente patron de *:
# a. Método letra_o(n)            b. Método letra_i(n)
#
# d. Método letra_x(n)
# n = 5 
# *   *
#  * *
#   *
#  * *
# *   *

def patron(num_ingr)                                            # Inicio Metodo

        print "*" + " "*(num_ingr-2) + "*"                    # linea Inicial
        puts

        a=1                                                         # Inicio parte superior
        b=num_ingr-4
            (num_ingr/2-1).times do
                puts " "*a + "*" + " "*(b) +"*"+" "*a
                a+=1
                b-=2
                end                                                 # Fin parte superior
                
        puts " "*(num_ingr/2)+ "*"+" "*(num_ingr/2)           # Linea Media      

        a=(num_ingr/2-1)                                            # Inicio parte Inferior
        b=1
            (num_ingr/2-1).times do
                
                puts " "*a + "*" + " "*(b) +"*"+" "*a
                a-=1
                b+=2
                end                                                 # Fin parte Inferior

        puts "*" + " "*(num_ingr-2) + "*"                      # Linea Final     
end                                                             # Fin Metodo

num_ingr=ARGV[0].to_i
if(num_ingr >= 3 ) && (num_ingr % 2 != 0 )                      # Valida Impar && > 3
    system 'clear'
    puts "Letra X de dimension [#{num_ingr}]"                       # Msg Titulo
    puts 
    patron(num_ingr)                                                # Llama a Metodo
else                                                            # Msg Error
    puts "[ #{num_ingr} ] Argumento Invalido: Debe ser numero impar superior a 3."  
end


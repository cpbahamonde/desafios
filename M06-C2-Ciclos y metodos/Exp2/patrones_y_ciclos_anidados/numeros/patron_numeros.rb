# Programa que recibe por línea de comandos la cantidad de
# líneas, y dibuja el patrón
# Uso:
# ruby numeros.rb 5
# 1
# 12
# 123
# 1234
# 12345

def patron(num_ingr)                        # Inicio Metodo 
    num_impr=1
    (num_ingr+1).times do |i|               # Muestra linea numeros
        i.times do |j|
            print num_impr*(j+1)
        end
        puts
    end
end                                         # Inicio Metodo 

num_ingr=ARGV[0].to_i
if(num_ingr.class == Integer) && (num_ingr >= 1)                # Valida numero > 1
    system 'clear'
    puts "Patron de dimension [#{num_ingr}]"                    # Msg Titulo
    puts 
    patron(num_ingr)                                            # Llama a Metodo
else                                                            # Msg Error
    puts "[ #{num_ingr} ] Argumento Invalido: Debe ser numero entero > 1."  
end



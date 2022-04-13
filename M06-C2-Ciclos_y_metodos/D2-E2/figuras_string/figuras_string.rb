def menu
    system 'clear'
    puts "   MENU   "
    puts "(1) Cuadrado"
    puts "(2) Triangulo"
    puts "(3) Piramide"
    puts "(4) Salir"
    puts
    puts "Seleccione opcion"
end

def sub_menu()
                puts ""
                puts "¿Cúantos caracteres desea?"
                opc_lados = gets.chomp.to_i
                    if opc_lados >= 3
                    # system 'pause'
                else
                    puts "[ #{opc_lados} ] Argumento Invalido: Debe ser numero mayor a 3." 
                    system 'pause'
                    print (menu)
                    print (sub_menu)
            end
            return  opc_lados.to_i
end

# Crea Cuadrado
def cuadrado(num_ingr)                                            
    puts "*" * num_ingr                                         
     (num_ingr-2).times do                                      
             puts "*" + (" "*(num_ingr-2)) + "*"
     end                                                        
     puts "*" * num_ingr                                        
end 

# Crea Triangulo
def triangulo(num_ingr)                         
    (num_ingr+1).times do |i|               
        i.times do |j|
            print "*"   
        end
        puts
    end
end                                        

# Crea Piramide
def piramide(num_ingr)                         
    (num_ingr).times do |i|               
        i.times do 
            print "*"   
        end
        puts
    end
    puts "*" * num_ingr

    n = num_ingr-1
    while n >= 1
    puts "*" * n
    n = n - 1
    end
end  

opc_menu =""
lados =""
while opc_menu != 4
    
    print(menu)
    opc_menu = gets.chomp.to_i
    if opc_menu == 1
            lados=sub_menu()
            system 'clear'
            puts "[Su seleccion (#{opc_menu}) fue un Cuadrado de dimension #{lados} ] "
            puts
            cuadrado(lados)
            puts
            puts ""
            system 'pause'
        elsif opc_menu == 2
            lados=sub_menu()
            system 'clear'
            puts "[Su seleccion (#{opc_menu}) fue un Triangulo de dimension #{lados} ] "
            puts
            triangulo(lados)
            puts
            puts ""
            system 'pause'
        elsif opc_menu == 3
            lados=sub_menu()
            system 'clear'
            puts "[Su seleccion (#{opc_menu}) fue una Piramide de dimension #{lados} ] "
            puts
            piramide(lados)
            puts
            puts ""
            system 'pause'
        elsif opc_menu == 4
            puts "[ #{opc_menu} Saliendo ] "
        else
            puts "[ #{opc_menu} ] Argumento Invalido: Debe ser numero entre 1 y 4." 
            system 'pause'
    end
end


def menu(n)
    system 'clear'
    puts "   MENU   "
    puts "(1) Piedra"
    puts "(2) Papel"
    puts "(3) Tijera"
    puts "(4) Salir"
    puts
    print "Seleccione opcion"
    print" Jugador #{n}  "
    opc_menu = 0
    opc_menu = gets.to_i
    if opc_menu!=1 &&  opc_menu!=2 && opc_menu!=3 && opc_menu!=4
                puts "[ #{opc_menu} ] Argumento Invalido: Debe ser numero entre 1 y 4." 
        system 'pause'
        menu(n)
    elsif opc_menu == 4
        puts "[ #{opc_menu} ] Saliendo... "
        # system 'pause'
    end
    return opc_menu
end

def juego(jug1,jug2)
    system 'clear'

    if jug1 == 1
        j1="piedra"
    elsif jug1 == 2
        j1="papel"
    else
        j1="tijera"
    end
   
    if jug2 == 1
        j2="piedra"
     elsif jug2 == 2
        j2="papel"
     else
        j2="tijera"
    end

    puts "Jugador 1 juega : #{j1}."
    puts "Jugador 2 juega : #{j2}."

    if
        j1=="piedra" && j2=="papel" || j1=="papel" && j2=="tijera" || j1=="tijera" && j2=="piedra"
            puts 'Gana Jugador 2'
    elsif
        j1=="piedra" && j2=="tijera" || j1=="papel" && j2=="piedra" || j1=="tijera" && j2=="papel"
            puts 'Gana Jugador 1'
    else j1==j2
        puts 'EMPATE'
    end  
end

jug_1 = 0
jug_2 = 0

jug_1 = menu(1)

if jug_1 != 4
jug_2 = menu(2)
    if jug_2 != 4
        juego(jug_1,jug_2)
    end
end
puts "Gracias por jugar"

 

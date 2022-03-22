pers_opc = ARGV[0]
persona=pers_opc.downcase
    if persona == "piedra" || persona == "papel" || persona == "tijera"
        rpc = rand(0..2)
        if rpc==0 
                computador="piedra"
        elsif rpc==1 
                computador="papel"
        else    computador="tijera"
        end
        puts "Jugastes #{persona}."
        puts "Computador juega #{computador}."
        if persona==computador
            print'Empataste.'
            elsif
                persona=="piedra" && computador=="papel" || persona=="papel" && computador=="tijera" || persona=="tijera" && computador=="piedra"
                    print'Perdistes.'
            elsif
                persona=="piedra" && computador=="tijera" || persona=="papel" && computador=="piedra" || persona=="tijera" && computador=="papel"
                    print'Ganastes.'
        end  
     else 
        puts "Argumento invalido: Debe ser piedra, papel o tijera."
    end
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
        puts "Computador juega #{computador}."

        if persona==computador
        print'Empataste.'
 
    elsif
        persona=="piedra" && computador=="papel"
            print'Perdistes.'
        elsif
        persona=="piedra" && computador=="tijera"
            print'Ganastes.'
        elsif
        persona=="papel" && computador=="piedra"
            print'Ganastes.'
        elsif
        persona=="papel" && computador=="tijera"
            print'Perdistes.'
        elsif
        persona=="tijera" && computador=="piedra"
            print'Perdistes.'
        else
        persona=="tijera" && computador=="papel"
            print'Ganastes.'
        end  
 
    else 
        puts "Argumento invalido: Debe ser piedra, papel o tijera."
    end
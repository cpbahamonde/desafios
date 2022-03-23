# Crear el programa validar_edad.rb que contenga el siguiente código pero que cumpla
# las siguientes condiciones:
# ● Modificar el método para que reciba la edad
# ● Llamar al método 3 veces, con edades generadas al azar


def validar_edad(val_ed)
    edad = val_ed
    if edad >= 18
        puts "Mayor de edad"
        else
        puts "Menor de edad"
    end
end

3.times do |i|
    puts
    ed_rndm = rand(0..30)
    puts "Edad random #{i+1}: #{ed_rndm}"
    validar_edad (ed_rndm)
end

        

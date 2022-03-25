def promedio(array)
    n=array.count
    suma_notas=0
    puts "Los elementos del arreglo son:                #{array}"
    puts "La cantidad de elementos del arreglo son:     #{n}"
    n.times do |i|
        suma_notas = suma_notas + array[i]
    end
    puts "la suma de elementos del arreglo es:          #{suma_notas}"
    promedio=suma_notas/n
    # return # times devuelve cuenta
end

system 'clear'
visitas =[1000, 800, 250, 300, 500, 2500]
promedio=promedio(visitas) 
puts "El promedio de los elementos del arreglo es:  #{promedio}"
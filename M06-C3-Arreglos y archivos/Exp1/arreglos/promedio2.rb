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

def compara_arrays(array1,array2)





end
system 'clear'
notas_1 =[6.0, 5.5, 7.0, 3.0, 5.0, 6.5]
notas_2 =[5.0, 4.5, 6.0, 2.0, 4.0, 5.5]
promedio_1=promedio(notas_1)
promedio_2=promedio(notas_2)
puts "El promedio de notas1 es:  #{promedio_1}"
puts "El promedio de notas2 es:  #{promedio_2}"
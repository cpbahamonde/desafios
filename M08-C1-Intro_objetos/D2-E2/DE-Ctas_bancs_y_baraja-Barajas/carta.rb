# Ejercicio 2
# Baraja de cartas
# ●Crear la clase carta con los atributos numero y pinta.(1 Punto)
# ●Agregar los getters y setters a ambos atributos.
# ●Crear el constructor de la clase carta que le permita recibir un número del 1 al 13 y la pinta que está indicada por una sola letra. Puede ser Corazón: 'C', Diamante: 'D', Espada: 'E' o Trébol: 'T'. (1 Punto)
# ●Utilizar el ejercicio Carta creado en la primera parte y dejarlo en el archivo carta.rb.
# ●Al crear una baraja (constructor) se deben generar todas las combinaciones de números y pinta y guardarse dentro del arreglo cartas.

class Carta
    attr_accessor :numero, :pinta 
    def initialize(numero,pinta)
        @numero = numero
        @pinta = pinta
    end
end

def crear_baraja
    cartas = []
    num_carta = [1,2,3,4,5,6,7,8,9,10,11,12,13]
    pint_carta = ['C','D','E','T']
    comb_carta = num_carta.product(pint_carta)
    num=1
    comb_carta.each do |comb| 
        cartas.push Carta.new(num,comb)
        num +=1
    end
    return cartas
end


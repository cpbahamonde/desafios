# Ejercicio 1


# ● Crear la clase carta con los atributos numero y pinta. (1 Punto)
# ● Agregar los getters y setters a ambos atributos.(1 Punto)
class Carta
    attr_accessor :numero, :pinta
    def initialize(numero,pinta)
        @numero = numero
        @carta = numero,@pinta = pinta
    end
end

# ● Crear el constructor de la clase carta que le permita recibir un número del 1 al 13 y la pinta que está indicada por una sola letra. Puede ser Corazón: 'C', Diamante: 'D', # Espada: 'E' o Trébol: 'T'. (2 Puntos)
cartas = []
pintas = ['C','D','E','T']

# ● Tip 1: Para escoger un número al azar ocupar # Random.rand(rango_inferior, rango_superior).
# ● Tip 2: Agregar las pintas posibles en un arreglo y ocupar el método .sample.
# ● Probar la clase creando un arreglo con 5 cartas.(1 Punto)
cant_cartas = 5
cant_cartas.times do |i|
    pinta = Random.rand(1..4)
    cartas.push Carta.new(Random.rand(1..13), pintas.sample)
end
print cartas



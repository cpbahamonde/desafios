
# Ejercicio 2
# Baraja de cartas
# ●Crear la clase carta con los atributos numero y pinta.(1 Punto)
# ●Agregar los getters y setters a ambos atributos.
# ●Crear el constructor de la clase carta que le permita recibir un número del 1 al 13 y la pinta que está indicada por una sola letra. Puede ser Corazón: 'C', Diamante: 'D', Espada: 'E' o Trébol: 'T'. (1 Punto)
        # Random numAleatorioCuenta = new Random();
        # this.numeroDeCuenta = Math.abs(numAleatorioCuenta.nextLong());
# ●Utilizar el ejercicio Carta creado en la primera parte y dejarlo en el archivo carta.rb.
# ●Crear la clase baraja en el archivo barajas.rb con el atributo cartas, el cual será un arreglo.(1 Punto)
# ●Al crear una baraja (constructor) se deben generar todas las combinaciones de números y pinta y guardarse dentro del arreglo cartas.

require_relative "carta" 
class Baraja
    attr_accessor :cartas
    def initialize(cartas)
        @cartas = cartas
    end
end

# ●Crear el método barajar que debe desordenar el arreglo de cartas Tip: Utilizar .shuffle.
def barajar(naipes)
    new_baraja = naipes.shuffle
    return new_baraja
end

# ●Crear el método sacar que permita retirar la primera carta de la baraja Tip: Utilizar .pop.(1 Punto)
def sacar(naipes)
    naipe_1 = naipes.pop
    return naipe_1.pinta
end

# ●Crear el método repartir mano que devolverá un arreglo con las primeras 5 cartas de la baraja.(1 Punto)
def repartir_mano(naipes,cant)
    nva_mano = []
    cant.times do |i|
        nva_mano.push naipes.sample
    end
    # print nva_mano
    # system 'pause'
    return nva_mano
end

baraja=crear_baraja()
system 'clear' 
puts "Baraja Inicial"
puts "=============="   
baraja.map do |carta|
    print carta.numero
    print carta.pinta
    puts
end
puts
system 'pause'  

naipes_barajados=barajar(baraja)
system 'clear' 
puts "Naipes barajados"
puts "================"   
naipes_barajados.map do |carta|
    print carta.numero
    print carta.pinta
    puts
end
puts
system 'pause'  

prim_carta=sacar(naipes_barajados)
system 'clear' 
puts "1a carta de naipes barajados"
puts "============================"   
print prim_carta
puts
puts
system 'pause'  

mano=repartir_mano(naipes_barajados,5)
system 'clear' 
puts "Mano de 5 cartas"
puts "================"   
mano.map do |carta|
    print carta.numero
    print carta.pinta
    puts
end
puts
system 'pause'  

system 'clear' 
puts "Gracias por jugar"

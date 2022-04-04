# El usuario ingresa un número, se muestra la suma de todos los números de 1 hasta ese número.
# Uso:
# suma_n.rb 100
# 5050

num_ingr = ARGV[0].to_i
i=1
s=0
while i <= num_ingr
    s += i
    i += 1
end
puts " #{s}"
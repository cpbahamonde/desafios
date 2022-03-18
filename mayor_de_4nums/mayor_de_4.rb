# Este script toma 4 argumentos y determina cuál es el mayor.
# Si el cuarto argumento es omitido sólo se calcula el mayor de 3.
# Uso:
# ruby mayor_de_4.rb 10 5 3 12
# 12
# ruby mayor_de_4.rb 12 12 12 9
# 12
# ruby mayor_de_4.rb -21 9 39 0
# 39
# Evaluación
# Se evaluará el output, por lo que tiene que ser idéntico al de los ejemplos dados, sin saltos
# de línea adicionales.

# ● ¿Qué será ARGV[3] si se entregan sólo tres argumentos?
# ●     Respuesta: ARGV[3]=0

n1 = ARGV[0].to_i
n2 = ARGV[1].to_i
n3 = ARGV[2].to_i
n4 = ARGV[3].to_i
# puts "ARGV[3] #{n4}"
if n1 >= n2 && n1 >= n3 && n1 >= n4
    print n1
elsif n2 >= n1 && n2 >= n3 && n2 >= n4
    print n2
elsif n3 >= n1 && n3 >= n2 && n3 >= n4
    print n3
else
    print n4
end
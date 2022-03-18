# Este script toma 3 argumentos y determina cuál es el mayor.
# Uso:
# ruby mayor_de_3.rb 10 5 3
# 10
# ruby mayor_de_3.rb -21 9 39
# 39
# ruby mayor_de_3.rb 3 2 3
# 3
# Evaluación
# Se evaluará el output, por lo que tiene que ser idéntico al de los ejemplos dados, sin saltos de línea adicionales.

n1 = ARGV[0].to_i
n2 = ARGV[1].to_i
n3 = ARGV[2].to_i
if n1 >= n2 && n1 >= n3
    print n1
elsif n2 >= n1 && n2 >= n3
    print n2
else
    print n3
end
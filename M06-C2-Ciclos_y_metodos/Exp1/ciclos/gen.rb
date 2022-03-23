# Sabiendo que "a.next" => b y "b.next" => c . Crear un método llamado 
# gen que reciba el número de letras a generar y devuelva un
# string con todas las letras generadas concatenadas.
# Ejemplo:
# gen(4)
# "abcd"
# gen(10)
# "abcdefghij"

num_ingr = ARGV[0].to_i
i=0
letr="a"
print "\""
while i < num_ingr
    print "#{letr}"
    letr=letr.next
    i += 1
end
puts "\""


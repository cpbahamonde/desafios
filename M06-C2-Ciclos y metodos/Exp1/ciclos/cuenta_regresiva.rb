# reemplazar instrucción until por while, impresión debe ser la misma
# Uso:
# ruby cuenta_regresiva.rb 10
# Contando desde 10... 10 9 8 7 6 5 4 3 2 1

cuenta_regresiva = ARGV[0].to_i
puts
print "Contando desde #{cuenta_regresiva}..."
while cuenta_regresiva >= 1
print " #{cuenta_regresiva}"
cuenta_regresiva -= 1
end
puts
precio_ventas = ARGV[0].to_f
usuarios = ARGV[1].to_f
premium = ARGV[2].to_f
gratis = ARGV[3].to_f
gastos = ARGV[4].to_f
Impuestos = 0.35

normal = (usuarios - premium - gratis)
vtas_premium = (premium*precio_ventas*2)
vtas_normal = (normal*precio_ventas)
ventas_totales = vtas_premium + vtas_normal
utils_net = (ventas_totales - gastos)

puts
puts "Precio de venta $ #{precio_ventas}"
puts
print "Usuarios Premium :     #{premium}    "
puts "Valor ventas Premium      $ #{vtas_premium}"
print "Usuarios Normales :    #{normal}    "
puts "Valor ventas Normal       $ #{vtas_normal}"
print "Usuarios Gratis :      #{gratis}    "
puts "Valor                     $    00.0"
print "Total Usuarios :      #{usuarios}    "
puts "Valor Ventas Total        $ #{ventas_totales}"
puts "                                Valor Gasto Total        -$ #{gastos}"
puts "                                                       ============="
puts "                                Valor Utilidad Neta       $ #{utils_net}"

if utils_net > 0
    utilidades = (utils_net) * (1 - Impuestos)
    imp_utils =  (utils_net - utilidades)
    imp_txt = " <-- {Aplica Impuesto}" 
    puts
    puts "Impuesto aplicado   $ #{imp_utils}  #{imp_txt}"
    else
        utilidades = (utils_net)
        imp_utils = "     00.0"
        imp_txt = " <-- {NO Aplica Impuesto dd}" 
        puts
        puts "Impuesto aplicado  $ #{imp_utils}  #{imp_txt}" 
end

puts "Utilidad Final     $ #{utilidades}"

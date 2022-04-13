precio_ventas = ARGV[0].to_f
usuarios = ARGV[1].to_f
gastos = ARGV[2].to_f
Impuestos = 0.35
util_net = (precio_ventas * usuarios - gastos)

if util_net > 0

    utilidades = (util_net) * (1 - Impuestos)
    imp_app = (util_net - utilidades)
    imp_txt = " <-- {Aplica Impuesto}" 
else
    utilidades = util_net
    imp_app = "     00.0" 
    imp_txt = " <-- {NO Aplica Impuesto}"
end

puts
puts "Utilidad Neta     $ #{util_net}"
puts "Impuesto aplicado $ #{imp_app}    #{imp_txt}"
puts "Utilidad Final    $ #{utilidades}"
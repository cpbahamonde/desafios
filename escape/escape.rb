g = ARGV[0].to_f
r = ARGV[1].to_f

rmts = r*1000
form1 = 2*g*rmts

ve = Math.sqrt(form1)

puts
puts "La gravedad en MTS es #{g} mts/s^2"
puts "El radio en KMS es #{r} kms"
puts "El radio en MTS es #{rmts} mts"
puts
puts "La velocidad de escape es de #{ve} mts/s"
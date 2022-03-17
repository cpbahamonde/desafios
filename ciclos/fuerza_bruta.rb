# crear un programa que revise cuantos intentos requiere hackear un password por fuerza bruta.
# Uso:
# ruby fuerza_bruta.rb pass
# 282404 intentos
# ruby fuerza_bruta.rb passwo
# 190906392 intentos
# Se supone que el password solo contiene letras.**
# Tip: Partir con intento = 'a'.

pass_ingr = ARGV[0]
# pass_ingr = "pass"
i=1
letr="a"
while letr != pass_ingr
    letr=letr.next
    i+=1
end 
print "#{i} intento(s)"

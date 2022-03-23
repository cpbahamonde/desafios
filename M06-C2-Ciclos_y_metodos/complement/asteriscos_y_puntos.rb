# programa dibuja asteriscos y puntos intercalados hasta n. 
# Donde n es un valor ingresado por el usuario al momento de ejecutar el
# script.
# Uso:
# ruby asteriscos_y_puntos.rb 3
# resultado:
# *.*
# ruby asteriscos_y_puntos.rb 4
# resultado:
# *.*.
# ruby asteriscos_y_puntos.rb 5
# resultado:
# *.*.*

num_ingr = ARGV[0].to_i
num_ingr.times do |i|
    if i%2==0
        print '*'
    else
        print '.'
    end
end

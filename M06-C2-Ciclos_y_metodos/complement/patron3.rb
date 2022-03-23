# Programa que permita dibujar el siguiente patrón:
# ..**||..**||..**||
# Ejemplo de uso:
# ruby patron3.rb 4

num_ingr = ARGV[0].to_i
num_ingr.times do |i|
    if i%3==0 
        print '..'
    elsif i%3==1
        print '**'
    else
        print '||'
    end
end


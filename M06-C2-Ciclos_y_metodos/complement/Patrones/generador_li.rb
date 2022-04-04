# Programa donde el usuario ingresa un número como argumento
# y se genera una lista de HTML con esa cantidad de ítems.
# Uso:
# ruby lista_html.rb 5
# <ul>
# <li> 1 </li>
# <li> 2 </li>
# <li> 3 </li>
# </ul>
# Pistas:
# ● Puedes tabular con "\t"
# ● Puedes hacer un salto de línea con "\n"
# ● Hay elementos que están antes del ciclo y otros después.

num_ingr=ARGV[0].to_i
if(num_ingr >= 3 )                                  
    system 'clear'
    puts "lista HTML de dimension [#{num_ingr}]"        
    puts
    i = 2
    puts "<ul>"
        while i < num_ingr 
            puts "\t<li> #{i-1} </li>\n"
            i += 1
        end
    puts "</ul>"
    puts                                    
    else                                                
        puts "[ #{num_ingr} ] Argumento Invalido: Debe ser numero superior o igual a 3."  
end

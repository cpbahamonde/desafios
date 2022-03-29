
if File.exists?("resultados.data")
    File.delete("resultados.data")
end


def read_file(filename)
    file_conv = []
    file_conv  = File.read(filename).split(",") # .map { |line| line.split(' ') }
    # original_data  = File.read(filename).split
    # original_data.foreach {|line| file_conv << line.chomp.split(",") }
    #  puts"original_data: #{original_data}"
    # system 'pause'
    
    puts"file_conv: #{file_conv}"
    system 'pause'
    return file_conv
end

# "Current amount: #{amount.round(2)}"

#  puts "Current amount: #{format("%.2f", amount)}"



# b.map{ |arr| arr.map{ |v| v.to_f } }

def calc_sem(array_data)
sem1=0.10
sem2=0.20
result= []
        puts"result.class: #{result.class}"
        system 'pause'

       data_flt=array_data.map{ |v| v.to_f.round(2) } 
        puts"data_flt: #{data_flt}"
        system 'pause'
 

        data_flt.each_slice(6).each_with_index do |elem, index|
        puts"data_flt[elem]: #{elem}"
         puts"data_flt[index]: #{index}"
        system 'pause'
        
        result["Q#{index + 1}"].to_s = elem.map { |s| s * 10 }
        puts"result: #{result}"
        system 'pause'
    
        end
print result
system 'pause'
end

# input.each_slice(2).sum { |a, b| a + 2* (b || 0) }





datos_arch=read_file('ventas_base.db')
puts "datos_arch: #{datos_arch}"
system 'pause'


 datos_modif=calc_sem(datos_arch)
# puts "datos_array: #{datos_array}"
# system 'pause'

# File.open('nota_mas_alta.data', 'w') do |file|
#     datos_array.each_slice(2) do |nombre,nota|
#         file.write("#{nombre},#{nota}\n")
#     end
# end






















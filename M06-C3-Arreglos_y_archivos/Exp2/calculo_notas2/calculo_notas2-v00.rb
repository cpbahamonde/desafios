
if File.exists?("nota_mas_alta.data")
    File.delete("nota_mas_alta.data")
end
system 'pause'
system 'clear'

def read_file(filename)
    file_conv = []
    original_data = File.open(filename, "r")
    original_data.each_line {|line| file_conv << line.chomp.split(",") }
    puts"file_conv: #{file_conv}"
    system 'pause'
    return file_conv
end

def nota_mas_alta(array_data)
    array =[]
    array_data.each do |nombre|
        nombre.each_with_index do |nota,index|
            # puts "index: #{index}"
            # puts "array: #{array}"
            # puts "nombre: #{nombre} nombre.class: #{nombre.class}"
            # puts "nota: #{nota} nota.class: #{nota.class}"
            # system 'pause'
            if index == 0 
                array << nota
                # puts"yes"
                # puts "array: #{array}"
                # system 'pause'
                # nombre << 
                nombre.shift
                # puts "nombre.shift: #{nombre.shift}"
                # puts "nombre: #{nombre}" 
                # system 'pause'
            else 
                # puts "NO---Maximo"          

                nom_int=nombre.map{ |v| v.to_i } 

                # puts "array: #{array}"
                # puts "nombre: #{nom_int}" 
                # puts "nombre[index].max(): #{nom_int.max()} "
                # system 'pause'
                array << nom_int.max().to_s
                break
            end
        end
    end
        # puts '=====array====='
        # puts "array: #{array}"
        # system 'pause'
        return array
end

datos_arch=read_file('notas.data')

datos_array=nota_mas_alta(datos_arch)
puts "datos_array: #{datos_array}"
system 'pause'

File.open('nota_mas_alta.data', 'w') do |file|
    datos_array.each_slice(2) do |nombre,nota|
        file.write("#{nombre},#{nota}\n")
    end
end









# music_library.each do |artist_array|
#   # Iterate through the parent array, returning each element sequentially
#   # For the first pass: artist_array = music_library[0] = ["Adele", ["19", ["Day Dreamer", "Best for Last"]], ["21", ["Rolling in the Deep", "Rumor Has It"]]]

#   artist_array.each do |artist_element|
#     # Iterate through each element of the child (second-level) array returned by the above parent iteration
#     # For the first pass: artist_element = artist_array[0] = music_library[0][0] = "Adele"

#     if artist_element.class != Array
#       puts "Artist: #{artist_element}"
#     else
#       artist_element.each do |album_element|


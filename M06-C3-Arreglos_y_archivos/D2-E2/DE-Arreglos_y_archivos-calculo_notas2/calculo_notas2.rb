
if File.exists?("nota_mas_alta.data")
    File.delete("nota_mas_alta.data")
end

def read_file(filename)
    file_conv = []
    original_data = File.open(filename, "r")
    original_data.each_line {|line| file_conv << line.chomp.split(",") }
    return file_conv
end

def nota_mas_alta(array_data)
    array =[]
    array_data.each do |nombre|
        nombre.each_with_index do |nota,index|
            if index == 0 
                array << nota
                nombre.shift
            else 
                nom_int=nombre.map{ |v| v.to_i } 
                array << nom_int.max().to_s
                break
            end
        end
    end
    return array
end

datos_arch=read_file('notas.data')

datos_array=nota_mas_alta(datos_arch)

File.open('nota_mas_alta.data', 'w') do |file|
    datos_array.each_slice(2) do |nombre,nota|
        file.write("#{nombre},#{nota}\n")
    end
end

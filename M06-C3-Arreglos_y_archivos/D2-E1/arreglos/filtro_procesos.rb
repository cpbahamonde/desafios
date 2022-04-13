
if File.exists?("procesos_filtrados.data")
    File.delete("procesos_filtrados.data")
end

system 'clear'
system 'pause'

def read_file(filename)
    original_data = open(filename).readlines
    lines= original_data.count
    # print lines
    array =[]
    lines.times do |i|
        array << original_data[i].to_i
    end
    return array
end

def selecc(data)
    output = []
    n = data.count
    n.times do |i|
    output << data[i] if data[i] > 250
    end
    return output
end

datos=read_file('procesos.data')
salida=selecc(datos)
print salida

File.open('procesos_filtrados.data', 'w') do |file|
  file.write salida.join("\n") 
end

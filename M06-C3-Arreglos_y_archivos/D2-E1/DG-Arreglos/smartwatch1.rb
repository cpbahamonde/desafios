pasos = ['100','21', '231as','2031', '1052000','213b','b123']

def clear_steps(arr)
arr.map! {|x| x.to_i}
arr.reject{|x| x < 200 || x > 100000 }
end

system 'clear'
filtrado=clear_steps(pasos)
print filtrado
puts

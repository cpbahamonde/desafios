
arr_orig=[120,50,600,30,90,10,200,0,500,180]
arr_final=[]

def scan_addicts2(array)
    arr_result = []
    n = array.count
    n.times do |i|
        if array[i] < 90
            arr_result.push 'bien'
        elsif array[i] >= 90 && array[i] < 180
            arr_result.push 'mejorable'
        else
            arr_result.push 'mal'
        end
    end
    arr_result
end

arr_final=scan_addicts2(arr_orig)
puts "#{arr_orig}"
puts "#{arr_final}"
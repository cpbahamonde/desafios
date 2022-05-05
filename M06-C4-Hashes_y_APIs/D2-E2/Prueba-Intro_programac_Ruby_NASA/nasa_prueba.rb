require "uri"
require "net/http"
require "json"

def request(data_nasa)
    url = URI(data_nasa)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request ["cache-control"] = 'no-cache'
    request ["Postman-Token"] = 'c74768d-1c67-49a3-ac03-a3ec49d69c74'
    response = https.request(request)
    hash_body = JSON.parse(response.read_body)
end

data_nasa = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=LljzvezyiC18wX10gBdgdur20FFGtegZbmAhHcJV")
print data_nasa 
system 'pause'
def build_web_page(data)

    hash_new=data['photos']
    system 'clear'
    fotos_src = hash_new.map {|dkey| dkey['img_src']}
    wpg_estr = "<!DOCTYPE html>\n<html lang="'en'">\n\t<head>\n\t\t<meta charset="'UTF-8'">\n\t\t<meta http-equiv="'X-UA-Compatible'" content="'IE=edge'">\n\t\t<meta name="'viewport'" content="'width=device-width, initial-scale=1.0'">\n\t\t<title>NASA WebPage</title>\n\t</head>\n\t<body>\n\t\t<h1><center>Fotos de MARTE (NASA)</center></h1>\n\t\t<ul>\n"    
    i=1       
    fotos_src.each do |dato|
        wpg_estr += "\t\t\t<li style="'list-style-type:none;'"><center><h2><center>Foto #{i} </h2></center><center><img height="'300'" width="'300'" src='#{dato}'></center></li>\n"
        i+=1
    end
    wpg_estr +="\t\t</ul>\n\t</body>\n</html>\n"
    File.write("nasa_webpage.html",wpg_estr)
end

if File.exists?("nasa_webpage.html")
    File.delete("nasa_webpage.html")
end

build_web_page(data_nasa)


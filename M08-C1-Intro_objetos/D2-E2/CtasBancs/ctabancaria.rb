
class Usuario
    attr_reader :nombre, :cuentas, :saldoTotal
    def initialize(nombre,cuentas)
        @nombre = nombre
        @cuentas = cuentas
    end
    def getSaldoTotal
        @saldoTotal = @cuentas.map {|cuenta| cuenta.saldoDeCuenta}.sum
    end
end

class CuentaBancaria
    attr_accessor :banco, :numeroDeCuenta, :monto, :saldoDeCuenta
    def initialize(banco, numeroDeCuenta, saldoDeCuenta=0)
        @banco = banco
        raise RangeError, 'Nums de Cta deben ser de 8 digitos' if (numeroDeCuenta.chars.count != 8)
        @numeroDeCuenta = numeroDeCuenta
        raise RangeError, 'Monto deber ser mayor a 0' if (saldoDeCuenta <=0 )
        @saldoDeCuenta = saldoDeCuenta
    end
    def transferir (monto, cta_dest)
        @saldoDeCuenta -= monto
        cta_dest.saldoDeCuenta += monto
    end
end

def muestraDatos(user1,cta11,cta12,user2,cta21,cta22)
    puts " __________________"
    puts "|Resumen de cuentas|"
    puts " ------------------"
    puts
    puts "Cliente: #{user1.nombre}, Banco: #{cta11.banco}, N°Cta: #{cta11.numeroDeCuenta}, Saldo: $#{cta11.saldoDeCuenta}"
    puts "Cliente: #{user1.nombre}, Banco: #{cta12.banco}, N°Cta: #{cta12.numeroDeCuenta}, Saldo: $#{cta12.saldoDeCuenta}"
    puts "El Saldo total del cliente #{user1.nombre} es de: $#{user1.getSaldoTotal}"
    puts
    puts "Cliente: #{user2.nombre}, Banco: #{cta21.banco}, N°Cta: #{cta21.numeroDeCuenta}, Saldo: $#{cta21.saldoDeCuenta}"
    puts "Cliente: #{user2.nombre}, Banco: #{cta22.banco}, N°Cta: #{cta22.numeroDeCuenta}, Saldo: $#{cta22.saldoDeCuenta}"
    puts "El Saldo total del cliente #{user2.nombre} es de: $#{user2.getSaldoTotal}"
    puts
    system 'pause'
end

def preTransf(mTransf, uOrig, cOrig, uDest, cDest)
    puts
    puts "Se ha solicitado una transferencia entre cuentas" 
    puts
    puts "Origen    : #{uOrig.nombre}, Banco #{cOrig.banco}, N°Cta #{cOrig.numeroDeCuenta}"
    puts "Destino   : #{uDest.nombre}, Banco #{cDest.banco}, N°Cta #{cDest.numeroDeCuenta}"
    puts "Monto     : $#{mTransf}"
    puts
    puts "=================================="
    system 'pause'
end

def posTransf(mTransf, uOrig, cOrig, uDest, cDest)
    puts
    puts "Se ha transferido entre cuentas" 
    puts "Monto     : $#{mTransf}"
    puts "Origen    : Cliente #{uOrig.nombre}, Banco #{cOrig.banco}, N°Cta #{cOrig.numeroDeCuenta}"
    puts "Destino   : Cliente #{uDest.nombre}, Banco #{cDest.banco}, N°Cta #{cDest.numeroDeCuenta}"
    puts
    puts "=================================="
end

# Test Ruby Raise Exceptions 
# testCtaNum = CuentaBancaria.new('BE','123456789',10000)
# testCtaMonto = CuentaBancaria.new('BE','12345678',0)

cuenta11 = CuentaBancaria.new('BICE','12345678',10000)
cuenta12 = CuentaBancaria.new('ITAU','00123456',15000)
cuenta21 = CuentaBancaria.new('BCI ','87654321',20000)
cuenta22 = CuentaBancaria.new('BBVA','00054321',25000)

usuario1 = Usuario.new('Claudio',[cuenta11,cuenta12])
usuario2 = Usuario.new('Gonzalo',[cuenta21,cuenta22])
system 'clear'
puts " ____________________________"
puts "|Cuentas con Saldos Iniciales|"
puts " ----------------------------"
muestraDatos(usuario1,cuenta11,cuenta12,usuario2,cuenta21,cuenta22)

# Transferencia entre cuentas mismo cliente 
monTransf=10000
userOrig = usuario1
userDest = usuario1
ctaOrig = cuenta11
ctaDest = cuenta12
system 'clear'
puts " _________________________________________"
puts "|Transferencia entre cuentas mismo cliente|"
puts " -----------------------------------------"
preTransf(monTransf,userOrig,ctaOrig,userDest,ctaDest)
ctaOrig.transferir(monTransf,ctaDest)
posTransf(monTransf,userOrig,ctaOrig,userDest,ctaDest)
muestraDatos(usuario1,cuenta11,cuenta12,usuario2,cuenta21,cuenta22)

# Transferencia entre cuentas distintos clientes 
monTransf=25000
userOrig = usuario1
userDest = usuario2
ctaOrig = cuenta12
ctaDest = cuenta21
system 'clear'
puts " ______________________________________________"
puts "|Transferencia entre cuentas distintos clientes|"
puts " ----------------------------------------------"
preTransf(monTransf,userOrig,ctaOrig,userDest,ctaDest)
ctaOrig.transferir(monTransf,ctaDest)
posTransf(monTransf,userOrig,ctaOrig,userDest,ctaDest)
muestraDatos(usuario1,cuenta11,cuenta12,usuario2,cuenta21,cuenta22)
system 'clear'
puts " _________________________________________"
puts "| Gracias por preferirnos. Su Banco AMIGO |"
puts " -----------------------------------------"

class CuentaBancaria
    attr_accessor :nombre_usuario
    def initialize(nombre_usuario, numero_cuenta, cod = 0, vip='Normal')
        # raise RangeError, 'numero de cuenta debe tener 8 digitos' if numero_cuenta.digits.count != 8
        # raise ArgumentError, 'numero de cuenta debe tener 8 digitos' if numero_cuenta.chars.count != 8
        raise RangeError, 'numero de cuenta debe tener 8 digitos' if numero_cuenta.chars.count != 8
        raise RangeError, 'cuenta vip deber ser 0 o 1' if (cod !=0 && cod !=1)
        @nombre_usuario = nombre_usuario
        @numero_cuenta = numero_cuenta
        @cod = cod
        (vip = "VIP") if cod == 1
        @vip = vip
    end
    def numero_de_cuenta
        "Cuenta: #{@vip}-#{@cod}-#{@numero_cuenta}"
    end
end

# => :numero_de_cuenta

# cta1 = CuentaBancaria.new('Claudio', '123456789',3).numero_de_cuenta
# cta1 = CuentaBancaria.new('Claudio', '12345678',3).numero_de_cuenta
# cta1 = CuentaBancaria.new('Claudio', '12345678').numero_de_cuenta
cta1 = CuentaBancaria.new('Claudio', '12345678',1).numero_de_cuenta

 print cta1
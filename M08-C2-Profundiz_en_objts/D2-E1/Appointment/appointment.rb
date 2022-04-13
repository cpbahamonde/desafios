# Paso1: Definiendo la Superclase 'Appointment' desde el UML entregado

class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize (location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

# Paso2: Definiendo la Subclase 'MonthlyAppointment' desde el UML entregado

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize (location, purpose, day, hour, min)
        super(location, purpose, hour, min)         #super trae las @vars_instancs de Superclase
        @day = day
    end
    def occurs_on?(day)                             # Valida si la cita corresponde a ese dia
        day == @day
    end
    def to_s
        "Reunion mensual en #{@location} sobre #{@purpose} el dia #{@day} a las #{hour}:#{min}."
    end
end

# Paso3: Definiendo la Subclase 'DailyAppointment' desde el UML entregado

class DailyAppointment < Appointment
    def occurs_on?(hour, min)                             # Valida si la cita corresponde a esa hora,minutos
        hour == @hour && min == @min
    end
    def to_s
        "Reunion mensual en #{@location} sobre #{@purpose} a las #{hour}:#{min}."
    end
end

# Paso4: Definiendo la Subclase 'OneTimeAppointment' desde el UML entregado

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize (location, purpose, day, month, year, hour, min)
        super(location, purpose, hour, min)           #super trae las @vars_instancs de Superclase
        @day = day
        @month = month
        @year = year
    end
    def occurs_on?(day, month, year, hour, minute)                             # Valida si la cita corresponde a esa fecha y hora
        day == @day && month == @month && year == @year && hour == @hour && min == @min
    end
    def to_s
        "Reunion mensual en #{@location} sobre #{@purpose} el dia #{@day} de #{@month} de #{@year} a las #{@hour}:#{@min}."
    end
end

system 'clear'
mes_cita1=MonthlyAppointment.new('NASA','Aliens',23,8,15)
puts mes_cita1
dia=23
puts "¿La cita mensual ocurre el dia #{dia}?: ", mes_cita1.occurs_on?(dia)
puts
system 'pause'

dia_cita1=DailyAppointment.new('Disney','Micky Mouse',13,15)
puts dia_cita1
hora=13
minuto=15
puts "¿La cita mensual ocurre a las #{hora}:#{minuto}? ", dia_cita1.occurs_on?(hora,minuto)
puts
system 'pause'

unica_cita1=OneTimeAppointment.new('Marvel','Superheroes',13,'Abril',2022,16,30)
puts unica_cita1
dia=13
mes='Abril'
agno=2022
hora=16
minuto=30
puts "¿La cita mensual ocurre el #{dia} de #{mes} de #{agno} a las #{hora}:#{minuto}?: ", unica_cita1.occurs_on?(dia,mes,agno,hora,minuto)
puts
system 'pause'


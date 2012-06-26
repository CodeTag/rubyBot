require 'socket'

class BomberBot
    def initialize
        begin
            self.conectar("rbBot", "984198716")
            self.controlConexion()
        rescue StandardError => e
            puts e
        end
    end

    def conectar user, token
        @socket_cliente = TCPSocket.open('localhost', 5000)
        bienvenida = socket_cliente.read
        puts bienvenida
        @socket_cliente.puts(user + "," + token)
        @conectado = true
    end

    def controlConexion
        response = nil
        while @conectado do
            puts "turno"

            server_message = socket_cliente.read
            
            message = serverMessage.split(";")

            if message[0] == "EMPEZO"
                bot = Bot.new(message[2][0])
                bot.updateMap(message[1])
            elsif message[0] == "TURNO"
                puts "turno: " + message[1]
                bot.updateMap message[2]
                msg = bot.move
                socket_cliente.puts(msg)
            elsif message[0] == "PERDIO"
                puts "perdi :("
            end
        end
    end
end

bot = BomberBot.new

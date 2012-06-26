require 'socket'

class BomberBot
    @in_from_server = nil
    @socket_cliente = nill
    @bot = Nothing

    @conectado = false

    def initialize()
        begin
            conectar("rbBot", "984198716")
            controlConexion()
        rescue StandardError => e
            puts e
            Console.ReadKey()
        End Try
    end

private
    def conectar user, token
        socket_cliente = TCPSocket.open('localhost', 5000)
        bienvenida = socket_cliente.read
        puts bienvenida
        socketCliente.puts(user + "," + token)
        conectado = true
    end

    def controlConexion
        response = nil
        while conectado do
            puts "turno"

            server_message = socket_cliente.read
            
            message = serverMessage.split(";")

            if message.length == 0
                continue
            end

            if message[0] == "EMPEZO"
                bot = Bot.new(message[2][0])
                bot.updateMap(message[1])
            else if message[0] == "TURNO"
                puts "turno: " + message[1]
                bot.updateMap message[2]
                msg = bot.move
                socket_cliente.puts(msg)
            else if message[0] == "PERDIO"
                puts "perdi :("
            end
        end
    end
end

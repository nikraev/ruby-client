require 'rubygems'
require 'socket'
require 'json'
require 'logger'
require_relative 'doc.rb'

$LOG = Logger.new('/var/log/application.log','monthly')
$LOG.level = Logger::DEBUG

class ClientSide
   def initialize(host, port)
     @host = host
     @port = port
   end
   
   def sendMessage(message)  
     @connect = TCPSocket.open(@host,@port)     
     doc = Document.new
     pocket = doc.createDocument(message)
     $LOG.debug("Generate document: #{pocket}")
     @connect.puts(pocket,0)
     $LOG.debug("Send message to client")
   end 
 
    def close
      @connect.close
    end
end

client = ClientSide.new("127.0.0.1",20000)
data = {
         :name => "Kolia",
         :age => 26,
         :complite => 'true'
        }
client.sendMessage(data)
client.close
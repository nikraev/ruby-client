require 'rubygems'
require 'socket'
require 'logger'
require_relative 'doc.rb'

$LOG = Logger.new('/home/nkraev/tmp/server.log','monthly')
$LOG.level = Logger::DEBUG

class ServerSide
  
  def initialize(host, port)
    @host = host
    @port = port
  end
  
  def start
    server = TCPServer.new(@host, @port)
    $LOG.debug("Start server on #{@host}:#{@port}")
    
    loop do
      Thread.start(server.accept) do |client|
        $LOG.debug("Client connected to server")
        message = client.gets
        $LOG.debug("Gets data from client")
        doc = Document.new(message)
        doc.saveMessage(message)
        
        client.puts(data,0)
        $LOG.debug("Server gets that data: #{data}")
        client.close
      end
    end
    server.close
  end
end


server = ServerSide.new("127.0.0.1", 20000)
server.start
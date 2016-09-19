require 'cool.io'

HOST = 'localhost'
PORT = 4321

class EchoServerConnection < Cool.io::TCPSocket
  def on_connect
    puts "#{remote_addr}:#{remote_port} connected"
  end

  def on_close
    puts "#{remote_addr}:#{remote_port} disconnected"
  end

  def on_read(data)
    write data
  end
end

class EchoServerConnection2 < Cool.io::TCPSocket
  def on_connect
    puts "foo bar#{remote_addr}:#{remote_port} connected"
  end

  def on_close
    puts "#{remote_addr}:#{remote_port} disconnected"
  end

  def on_read(data)
    write data
  end
end

loop = Cool.io::Loop.new

server2 = Cool.io::TCPServer.new(HOST, PORT, EchoServerConnection2)
server = Cool.io::TCPServer.new(HOST, PORT, EchoServerConnection)

loop.attach(server2)
loop.attach(server)

puts "Echo server listening on #{HOST}:#{PORT}"
loop.run

require 'msgpack/rpc'

PORT = 8080
HOST = '127.0.0.1'

class MyHandler
  def hello(value)
    puts "hello #{value}."
  end
end

server = Rrpc::Server.new
server.listen(HOST, PORT, MyHandler.new)
server.run

puts 'runngin server'

client = MessagePack::RPC::Client.new(HOST, POSRT)

p client.call(:hello, 'world')

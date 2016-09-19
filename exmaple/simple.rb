require 'msgpack/rpc'

PORT = 4321
ADDR = '127.0.0.1'

class MyHandler
  def foo(v)
    puts "received #{v}"
    'return result.'
  end
end

server = MessagePack::RPC::Server.new
server.listen(ADDR, PORT, MyHandler.new)
Thread.new { server.run }

client = MessagePack::RPC::Client.new(ADDR, PORT)
result = client.call(:foo, 1)
puts result

client = MessagePack::RPC::Client.new(ADDR, PORT)
result = client.call(:foo, 2)
puts result

require 'em-websocket'
@sockets = {}

#TODO: Move environmental config stuff to config
require './lib/database/development'
require './lib/app/controller'

@controller = Controller.new

EventMachine.run do
  EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8080) do |ws|
    ws.onopen do
      puts "WebSocket connection open"
      @sockets[ws] = "Anon"
      @sockets.each { |s,v| s.send "Anon has joined" }
    end

    ws.onclose do
      puts "Connection closed" 
      broadcast "#{@sockets[ws]} has quit"
      @sockets.delete(ws)
    end
    
    ws.onmessage do |msg|
      puts "Recieved message: #{msg}"
      begin
        ws.send @controller.parse(msg)
      rescue Exception => e
        puts e.message
        ws.send("Some kind of error happened")
      end
      
    end
    
  end  
end
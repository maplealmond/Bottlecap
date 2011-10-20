require 'em-websocket'

@sockets = {}

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
      
      def broadcast(msg)
        @sockets.each { |s,v| s.send(msg) }
      end
      
      if (msg[0] == '/') then
        command = msg.split(" ")[0]
        command.slice!(0)
        begin
          send(command.to_sym,ws,msg)
        rescue Exception => e
          puts e.message
          ws.send("Not sure what you meant to do there.")
        end
      else
        nick = @sockets[ws]
        broadcast "#{nick}: #{msg}"
      end
    end
    
  end
  
  def nick(ws, msg)
    old_nick = @sockets[ws]
    new_nick = msg.split(" ")[1]
    @sockets[ws] = new_nick
    broadcast "#{old_nick} is now known as #{new_nick}"
  end
  
  def roll(ws, msg)
    nick = @sockets[ws]
    broadcast "#{nick} rolled #{msg.split(" ")[1]} and got a #{rand(100)}"
  end
  
end
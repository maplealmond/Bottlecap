require './lib/app/game'
require './lib/app/dice'

class Controller
  
  def parse(msg)
    tokens = msg.split(" ")
    (0..(tokens.length - 1)).each do |len|
      command = tokens[0..len].join("_")
      if respond_to? command
        return send(command.to_sym,tokens[(len+1)..((tokens.length)-1)])
      end
    end
  end  
  
  def create_game(tokens)
    @game = Game.find_or_create_by(name: tokens[0])
    return "Game has been created"
  end
  
  def load_game(tokens)
    @game = Game.where(name: tokens[0]).first
    if @game
      return "Game has been loaded"
    else
      return "Game not found"
    end
  end
    
  def fudge(tokens)
    amount = tokens[0]
    Dice.fudge(amount)
    return "Next die roll fudged to #{amount}"
  end
  
  def roll(tokens)
    return "You rolled #{Dice.roll}"
  end
  
end
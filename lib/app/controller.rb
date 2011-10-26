require './lib/app/game'
require './lib/app/dice'
require './lib/app/map'

class Controller

  attr_accessor :game, :map
  
  def characters
    @game.characters
  end
  
  def parse(msg)
    tokens = msg.split(" ")
    (0..(tokens.length - 1)).each do |len|
      command = tokens[0..len].join("_")
      if respond_to? command
        return send(command.to_sym,tokens[(len+1)..((tokens.length)-1)])
      end
    end
  end  
  
  ##Commands... should these get their own module?
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
  
  def load_map(tokens)
    @map = Map.where(name: tokens[0]).first
    if @map
      return "Map has been loaded"
    else
      return "Map not found"
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
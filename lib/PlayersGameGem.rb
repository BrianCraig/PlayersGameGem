#require "PlayersGameGem/version"
require_relative 'Players'
require 'matrix'
module PlayersGameGem
  class Position < Vector
    public_class_method :new
    def initialize(array)
      @elements = array
    end

    def new(*args)

    end
  end

  class Game
    def initialize
      @players = PlayerGroup.new
    end
  end
end

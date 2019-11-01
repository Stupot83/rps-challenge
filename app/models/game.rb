# The Game class
class Game
  attr_reader :players

  @game_session = nil

  def initialize(player_1:, player_2:)
    @players = {}
    @players[:player_1] = player_1
    @players[:player_2] = player_2
    self.class.game_session = self
  end

  def self.game_session
    @game_session
  end

  def self.game_session=(value)
    @game_session = value
  end
end

require_relative '../../app/models/game.rb'
require_relative '../../app/models/player.rb'

describe Game do
  let(:game) { Game.new(player_1: player_1, player_2: player_2) }
  let(:game_class) { Game }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  describe "initialization" do
    it "instantiates the game class" do
      expect(game).to be_instance_of(Game) 
    end
  end

  describe "#game_session" do
    it "has the latest game instance" do
      game_one = Game.new(player_1: player_1, player_2: player_2)
      expect(game_class.game_session).to eq game_one
    end
  end

  describe "#players" do
    it "should have player one" do
      expect(game.players[:player_1]).to eq player_1
    end
    it "should have player 2" do
      expect(game.players[:player_2]).to eq player_2
    end
  end
end

require_relative '../../app/models/bot.rb'

describe Bot do

  let(:bot) { Bot }

  describe "#pick_turn" do
    it "responds to pick_turn" do
      expect(bot).to respond_to(:pick_turn)
    end
  end

  describe "#pick_turn" do
    it "picks a turn at random" do
      srand(1234)
      expect(bot.pick_turn).to eq :lizard
    end
  end
end

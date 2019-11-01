require_relative '../../app/models/turn.rb'

describe Turn do
  let(:turn) { Turn.new(player_1_turn: player_1_turn) }
  let(:turn_class) { Turn }
  let(:player_1_turn) { :rock }
  let(:player_2_turn) { :lizard }
  let(:result_calculator) { ResultCalculator }
  let(:winning_turn) { [:player_1, [:lizard, :spock, "poisons"]] }

  describe "initialization" do
    it "instantiates the Turn class" do
      expect(turn).to be_instance_of(Turn)
    end
  end
 
  describe "#round_instance" do
    it "has the latest turn instance" do
      turn_one = Turn.new(player_1_turn: player_1_turn)
      expect(turn_class.turn_session).to eq turn_one
    end
  end

  describe "#player_1_turn" do
    it "returns player 1's turn" do
      expect(turn.player_1_turn).to eq player_1_turn
    end
  end

  describe "#winning_turn" do
    it 'the winning_turn starts at nil' do
      expect(turn.winning_turn).to be nil
    end
  end

  describe "#finish_round" do
    before(:each) do
      allow(result_calculator).to receive(:winning_outcome) { winning_turn }
    end
    
    it "allows player 2 to place their turn and ends the turns" do
      expect { turn.end_turn(player_2_turn: player_2_turn) }.to change { turn.player_2_turn }
    end

    it "decides the winning move" do
      turn.end_turn(player_2_turn: player_2_turn)
      expect(turn.winning_turn).to eq winning_turn
    end
  end
end

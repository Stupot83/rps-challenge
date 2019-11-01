require_relative '../../app/models/result_calculator.rb'

describe ResultCalculator do
  let(:result_calculator) { ResultCalculator }

  describe "#winning_outcome" do
    it "responds to winning outcome" do
      expect(result_calculator).to respond_to(:winning_outcome)
    end
  end

  describe "#decide_winner" do
    it "returns player 1 as winner when paper vs rock" do
      expect(result_calculator.winning_outcome(:paper, :rock)).to include :player_1
    end

    it "returns player 2 as winner when rock vs paper" do
      expect(result_calculator.winning_outcome(:spock, :lizard)).to include :player_2
    end
  end
end

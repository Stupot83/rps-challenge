module ResultCalculator

  WINNING_TURNS = [
      [:lizard, :paper, "eats"],
      [:lizard, :spock, "poisons"],
      [:paper, :rock, "covers"],
      [:paper, :spock, "disproves"],
      [:rock, :scissors, "crushes"],
      [:rock, :lizard, "crushes"],
      [:scissors, :paper, "cuts"],
      [:scissors, :lizard, "decapitates"],
      [:spock, :scissors, "smashes"],
      [:spock, :rock, "vaporizes"], 
    ]

  def self.winning_outcome(player_1_turn, player_2_turn)
    winning_turn = [:player_1, WINNING_TURNS.map { |item| item[0] == player_1_turn && item[1] == player_2_turn ? item : [] }.flatten]
    winning_turn = [:player_2, WINNING_TURNS.map { |item| item[0] == player_2_turn && item[1] == player_1_turn ? item : [] }.flatten] if winning_turn[1] == []
    winning_turn
  end
end

# The Turn class
class Turn
  attr_reader :player_1_turn, :player_2_turn, :winning_turn, :result_calculator

  @turn_session = nil

  def initialize(player_1_turn:, result_calculator: ResultCalculator)
    @player_1_turn = player_1_turn
    @player_2_turn = nil
    self.class.turn_session = self
    @winning_turn = nil
    @result_calculator = result_calculator
  end

  def self.turn_session
    @turn_session
  end

  def self.turn_session=(value)
    @turn_session = value
  end

  def end_turn(player_2_turn:)
    @player_2_turn = player_2_turn
    @winning_turn = result_calculator.winning_outcome(player_1_turn, player_2_turn)
  end
end

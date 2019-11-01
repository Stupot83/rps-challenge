# The Bot module
module Bot
  BOT_MOVES = [:rock, :paper, :scissors, :lizard, :spock]

  def self.pick_turn
    BOT_MOVES.sample
  end
end

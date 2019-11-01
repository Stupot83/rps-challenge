def human_vs_human
  visit("/")
  fill_in "p1_name", :with => "Negan"
  fill_in "p2_name", :with => "Alpha"
  click_button("start_game")
end

def human_vs_computer
  visit("/")
  fill_in "p1_name", :with => "Negan"
  fill_in "p2_name", :with => "Alpha Bot"
  choose("player_2_type", { :option => "computer" })
  click_button("start_game")
end

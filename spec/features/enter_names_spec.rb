require 'features/web_helpers.rb'

feature "on the enter name screen" do
  scenario "the user can start a game with two human players" do
    human_vs_human
    expect(page).to have_text("Negan")
    expect(page).to have_text("Alpha")
  end

  scenario "the user can start a game against a bot" do
    human_vs_computer
    expect(page).to have_text("Negan")
    expect(page).to have_text("Alpha Bot")
  end
end

feature "the outcome page is displayed" do

  scenario "the outcome message is displayed" do
    human_vs_human
    choose("p1_choice", { :option => "lizard" })
    click_button('p1_turn')
    choose("p2_choice", { :option => "spock" })
    click_button('p2_turn')
    expect(page).to have_text("Lizard poisons Spock!")
  end
end

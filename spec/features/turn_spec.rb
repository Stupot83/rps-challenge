feature "when selecting a turn" do
  context "human versus human game" do
    before(:each) do
      human_vs_human
    end
    
    scenario "player 1 can see their choices of turn" do
      expect(page).to have_content("Rock")
    end

    scenario "player 2 can see their choices of turn" do
      expect(page).to have_content("Rock")
    end
  end
end

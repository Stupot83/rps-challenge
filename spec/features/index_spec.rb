feature 'on the index view' do
  scenario 'the game title is displayed' do
    visit '/'
    expect(page).to have_content('Rock, Paper, Scissors, Spock, Lizard')
  end
end

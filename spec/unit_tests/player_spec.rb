require_relative '../../app/models/player.rb'

describe Player do
  let(:player) { Player.new(name: name) }
  let(:name) { "Negan" }

  context "initialize" do

    it "the player class can be instantiated" do
      expect(player).to be_instance_of(Player)
    end

    describe "#name" do
      it 'stores the players name' do
        expect(player.name).to eq("Negan")
      end
    end

    describe "#human" do
      it 'defaults to true' do
        expect(player.human).to be true
      end

      describe "when human is set to false at initialisation" do
        let(:player) { Player.new(name: name, human: false) }
      
        it 'human attribute shows as false' do
          expect(player.human).to be false
        end
      end
    end
  end
end

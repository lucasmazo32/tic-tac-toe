# frozen_string_literal: true

require_relative('../lib/player.rb')

describe Player do
  describe '#name and symbol inside player' do
    it 'Player saves the name of the player' do
      player = Player.new('X', 'Joseph')
      expect(player.name).to eql('Joseph')
    end
    it 'Player saves the sym of the player' do
      player = Player.new('X', 'Joseph')
      expect(player.sym).to eql('X')
    end
  end
end

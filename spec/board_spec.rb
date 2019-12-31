# frozen_string_literal: true

require_relative('../lib/board.rb')
require_relative('../lib/player.rb')

describe Board do
  describe '#available' do
    it 'Returns the value of the index of the empty lines' do
      main_board = Board.new
      expect(main_board.available).to start_with [1, 2, 3]
    end
  end

  describe '#position' do
    context 'checks that the number is an integer between 1 and 9, and is available' do
      it "If it's true" do
        main_board = Board.new
        expect(main_board.position('2', 'X')).to be true
      end
      it "If it's false" do
        main_board = Board.new
        expect(main_board.position('r', 'X')).to be false
      end
    end
  end

  describe '#show' do
    it 'Returns an array which has the board' do
      main_board = Board.new
      expect(main_board.show).to be_a Array
    end
  end

  describe '#win_condition' do
    context 'Checks if a player has won or if the game is over due to no more spaces available' do
      it 'Tells returns false if a column, diagonal or row have the same symbol' do
        main_board = Board.new
        main_board.position(1,'X')
        main_board.position(2,'X')
        main_board.position(3,'X')
        expect(main_board.win_condition).to be false
      end

      it 'Tells returns false if all the spaces are taken and no column, diagonal or row have the same symbol' do
        main_board = Board.new
        main_board.position(1,'O')
        main_board.position(2,'X')
        main_board.position(3,'O')
        main_board.position(4,'X')
        main_board.position(5,'X')
        main_board.position(6,'O')
        main_board.position(7,'X')
        main_board.position(8,'O')
        main_board.position(9,'X')
        expect(main_board.win_condition).to be false
      end

      it 'Tells returns true if neither condition above is met' do
        main_board = Board.new
        expect(main_board.win_condition).to be true
      end
    end
  end
end

# frozen_string_literal: true

require_relative('../lib/board.rb')
require_relative('../lib/player.rb')

describe Board do
    describe '#available' do
        it 'Returns the value of the index of the empty lines' do
            main_board = Board.new
            expect(main_board.available).to start_with [1,2,3]
        end
    end

    describe '#position' do
        it 'Return true if the number is an integer between 1 and 9, and is available' do
            main_board = Board.new
            expect(main_board.position(2,"X")).to be true
        end
    end
end
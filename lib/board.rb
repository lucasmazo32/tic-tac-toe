# frozen_string_literal: true

class Board
  def initialize
    @state = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def available
    @state.each_index.select { |i| @state[i] == ' ' }.map { |x| x + 1 }
  end

  def position(num_pos, sym)
    move = num_pos.to_i
    if move <= 9 && move >= 1 && (move.is_a? Integer) && @state[move - 1] == ' '
      @state[move - 1] = sym
      true
    else
      false
    end
  end

  # method to print the table every iteration
  def show
    [
      "#{@state[0]} | #{@state[1]} | #{@state[2]}",
      '---------',
      "#{@state[3]} | #{@state[4]} | #{@state[5]}",
      '---------',
      "#{@state[6]} | #{@state[7]} | #{@state[8]}"
    ]
  end

  def win_condition
    (0...3).each do |i|
      return false if comparator(i * 3, i * 3 + 1, i * 3 + 2) || comparator(i, i + 3, i + 6)
    end
    return false if comparator(0, 4, 8) || comparator(2, 4, 6)
    return false if available.empty?

    true
  end

  private

  def comparator(first_index, second_index, third_index)
    @state[first_index] == @state[second_index] && @state[second_index] == @state[third_index] &&
      @state[third_index] != ' '
  end
end

# frozen_string_literal: true

class Board
  def initialize
    @state = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def available
    @state.each_index.select{|i| @state[i] == ' '}.map{ |x| x+1 }
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
      if (@state[i * 3] == @state[i * 3 + 1] && @state[i * 3 + 1] == @state[i * 3 + 2] && @state[i * 3 + 2] != ' ') ||
         (@state[i] == @state[i + 3] && @state[i + 3] == @state[i + 6] && @state[i + 6] != ' ')
        return false
      end
    end
    if (@state[0] == @state[4] && @state[4] == @state[8] && @state[8] != ' ') ||
       (@state[2] == @state[4] && @state[4] == @state[6] && @state[6] != ' ')
      return false
    end
    return false if available.empty?

    true
  end
end

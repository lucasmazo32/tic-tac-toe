# frozen_string_literal: true

class Player
  attr_reader :name
  attr_reader :sym

  def initialize(sym, name)
    @sym = sym
    @name = name
  end
end

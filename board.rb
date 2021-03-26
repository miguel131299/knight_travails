# frozen_string_literal: true

class Board
  def initialize(knight)
    @knight = knight
    @knight.set_board(self)
  end

  # takes an array of size 2
  def valid_position?(position)
    return false if position.length != 2

    position.all? { |coordinate| coordinate >= 0 && coordinate <= 7 }
  end
end

# frozen_string_literal: true

require_relative 'node'
require_relative 'graph'
require_relative 'board'
require_relative 'knight'

knight = Knight.new
board = Board.new(knight)

puts board.valid_position?([-1, 0])
p knight.get_possible_moves([0, 0])

path = knight.knight_moves([7, 5], [3, 2])
p path
translate = knight.tranlate_path(path)
p translate
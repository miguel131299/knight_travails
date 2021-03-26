# frozen_string_literal: true

X = 0
Y = 1

class Knight
  def initialize(board = nil)
    @board = board
  end

  def set_board(board)
    @board = board
  end

  def get_possible_moves(start)
    possible_moves = []

    # move up
    up_right = [start[X] + 1, start[Y] + 2]
    possible_moves << up_right

    up_left = [start[X] - 1, start[Y] + 2]
    possible_moves << up_left

    # move right
    right_up = [start[X] + 2, start[Y] + 1]
    possible_moves << right_up

    right_down = [start[X] + 2, start[Y] - 1]
    possible_moves << right_down

    # move down
    down_right = [start[X] + 1, start[Y] - 2]
    possible_moves << down_right

    down_left = [start[X] - 1, start[Y] - 2]
    possible_moves << down_left

    # move left
    left_up = [start[X] - 2, start[Y] + 1]
    possible_moves << left_up

    left_down = [start[X] - 2, start[Y] - 1]
    possible_moves << left_down

    possible_moves.select { |move| @board.valid_position?(move) }
  end

  def knight_moves(start, goal, path = [], _visited = [])
    graph = Graph.new(start, self)

    graph.find_shortest_path(goal)
  end

  def array_to_chess(pos)
    result = []

    result.append(pos[0] + 1)

    letter = nil

    case pos[1]
    when 1
      letter = 'a'
    when 2
      letter = 'b'
    when 3
      letter = 'c'
    when 4
      letter = 'd'
    when 5
      letter = 'e'
    when 6
      letter = 'f'
    when 7
      letter = 'g'
    when 8
      letter = 'h'
    end

    result.append(letter)

    result
  end

  def tranlate_path(path)
    path.map {|move| array_to_chess(move)}
  end
end

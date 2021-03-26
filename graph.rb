# frozen_string_literal: true

class Graph
  def initialize(start, mover)
    @start = Node.new(start)
    @mover = mover
  end

  def DFS(goal, node = @start, visited = [], queue = [])
    if node.data == goal
      puts 'found'
      return node
    end

    moves = @mover.get_possible_moves(node.data)

    moves.each do |move|
      move = Node.new(move, node)
      queue.append(move) unless visited.include?(move) || queue.include?(move)
    end

    visited.append(node)

    next_node = queue.shift

    DFS(goal, next_node, visited, queue)
  end

  def get_path(node)
    path = []
    current_node = node

    while current_node != @start
      path.prepend(current_node.data)
      current_node = current_node.parent
    end

    path.prepend(@start.data)

    path
  end

  def find_shortest_path(goal)
    node = DFS(goal)
    get_path(node)
  end
end

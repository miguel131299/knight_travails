# frozen_string_literal: true

class Node
  attr_reader :data, :parent
  def initialize(data, parent = nil, children = [])
    @data = data
    @parent = parent
    @children = children
  end

  def to_s
    "#{@data}"
  end
end

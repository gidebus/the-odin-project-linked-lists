# frozen_string_literal: true

# class representation of a node
class Node
  attr_accessor :value, :next_node

  def initialize(
    value = nil,
    next_node = nil
  )
    @value = value
    @next_node = next_node
  end
end

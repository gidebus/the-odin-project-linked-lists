# frozen_string_literal: true

require_relative './node'

class LinkedList

  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    @head = node if @head.nil?
    @tail.next_node = node if !@tail.nil?
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    @head = node if @head.nil?
    if !@head.nil?
      node.next_node = @head
      @head = node
    end
  end

  def size
    size = 0
    current_node = @head
    until current_node.nil?
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def at(index)
  end

  def pop
  end
  
  def contains?(value)
  end

  def find(value)
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    print '(nil) '
  end

end

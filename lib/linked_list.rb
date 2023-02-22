# frozen_string_literal: true

require_relative './node'

# class representation of a linked list and its methods
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    @head = node if @head.nil?
    @tail.next_node = node unless @tail.nil?
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
    node = @head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    return @head = nil if size <= 1

    node = @head
    node = node.next_node until node.next_node == @tail
    popped = @tail
    node.next_node = nil
    @tail = node
    popped
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    index = 0

    until node.nil?
      return index if node.value == value

      node = node.next_node
      index += 1
    end
    nil
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    print '(nil) '
  end

  def insert_at(value, index)

    return nil if index > (size - 1) || index < 0
    return prepend(value) if index == 0
    
    node = @head
    inserted_node = Node.new(value)
    i = 0

    until node.nil?
      if index == (i + 1)
        inserted_node.next_node = node.next_node
        node.next_node = inserted_node
        return node
      end

      node = node.next_node
      i += 1
    end
  end

  # def delete_at(index)
  # end
end

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
# list.append(4)
list.to_s
puts ''
list.insert_at('random', 2)
list.to_s
puts ''
p list.tail.value
p list.head.value

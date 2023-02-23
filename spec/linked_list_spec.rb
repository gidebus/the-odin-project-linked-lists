# frozen_string_literal: true

require_relative '../lib/linked_list'
require_relative '../lib/node'

describe LinkedList do
  let(:linked_list) { LinkedList.new }

  before(:each) do
    linked_list.append('a node')
    linked_list.append('another node')
  end

  describe '#append' do
    it 'adds a node to the end of the list' do
      expect(linked_list.tail.value).to eq('another node')

      linked_list.append('last node')
      expect(linked_list.tail.value).to eq('last node')
    end
  end

  describe '#prepend' do
    it 'adds a node to the beginning of the list' do
      expect(linked_list.head.value).to eq('a node')

      linked_list.prepend('first node')
      expect(linked_list.head.value).to eq('first node')
    end
  end

  describe '#size' do
    it 'returns the size of the list' do
      expect(linked_list.size).to eq(2)
      linked_list.append('yet another node')
      expect(linked_list.size).to eq(3)
    end
  end

  describe '#head' do
    it 'returns the first node on the linked list' do
      expect(linked_list.head.value).to eq('a node')
      linked_list.prepend('first node')
      expect(linked_list.head.value).to eq('first node')
    end
  end

  describe '#tail' do
    it 'returns the last node on the lined list' do
      linked_list.append('a node')
      expect(linked_list.tail.value).to eq('a node')
      linked_list.append('another node')
      expect(linked_list.tail.value).to eq('another node')
    end
  end

  describe '#at' do
    it 'returns the value of the node located at the specified index' do
      expect(linked_list.at(1).value).to eq('another node')
      expect(linked_list.at(0).value).to eq('a node')
    end
  end

  describe '#pop' do
    it 'removes and returns the last element of the linked list' do
      expect(linked_list.size).to eq(2)
      expect(linked_list.pop.value).to eq('another node')
      expect(linked_list.size).to eq(1)
    end
  end

  describe '#contains?' do
    it 'returns true if any node in the linked list has the same value' do
      expect(linked_list.contains?('another node')).to eq(true)
      expect(linked_list.contains?('not a node')).to eq(false)
    end
  end

  describe '#find' do
    it 'returns the index of the node containing the specified value' do
      expect(linked_list.find('a node')).to eq(0)
      expect(linked_list.find('another node')).to eq(1)
      expect(linked_list.find('not a node')).to eq(nil)
    end
  end

  describe '#to_s' do
    context 'prints all linked lists nodes' do
      specify { expect { linked_list.to_s }.to output('(a node) -> (another node) -> (nil) ').to_stdout }
    end
  end

  describe '#insert_at' do
    it 'inserts a node at the specified index' do
      expect(linked_list.size).to eq(2)

      linked_list.insert_at('inserted node', 1)
      expect(linked_list.size).to eq(3)
      expect(linked_list.at(1).value).to eq('inserted node')
    end

    it 'sets the inserted node as head if index is equal to 0' do
      expect(linked_list.head.value).to eq('a node')
      linked_list.insert_at('first node', 0)
      expect(linked_list.head.value).to eq('first node')
    end

    it 'does not overide the tail of the list if index is equal to the last element' do
      expect(linked_list.tail.value).to eq('another node')
      linked_list.insert_at('not new tail', 1)
      expect(linked_list.tail.value).to eq('another node')
    end
  end
  
  describe '#delete_at' do
    it 'deletes a node at the specified index' do
      linked_list.insert_at('Delete Me!', 1)
      expect(linked_list.size).to eq(3)
      expect(linked_list.contains?('Delete Me!')).to be(true)

      linked_list.delete_at(1)
      expect(linked_list.size).to eq(2)
      expect(linked_list.contains?('Delete Me!')).to be(false)
    end

    it 'sets the next node in sequence as head if index is equal to 0' do
      expect(linked_list.head.value).to eq('a node')
      linked_list.delete_at(0)
      expect(linked_list.head.value).to eq('another node')
    end

    it 'sets tail to the previous node from the tail of the sequence' do
      linked_list.append('last node')
      expect(linked_list.tail.value).to eq('last node')
      linked_list.delete_at(2)
      expect(linked_list.tail.value).to eq('another node')
    end
  end
end

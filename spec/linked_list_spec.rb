# frozen_string_literal: true

require_relative '../lib/linked_list'
require_relative '../lib/node'

describe LinkedList do
  let(:linked_list) { LinkedList.new }

  describe '#append' do
    it 'adds a node to the end of the list' do
      linked_list.append('first node')
      expect(linked_list.tail.value).to eq('first node')
    end
  end

  describe '#prepend' do
    it 'adds a node to the beginning of the list' do
      linked_list.append('a node')
      expect(linked_list.head.value).to eq('a node')
      linked_list.prepend('another node')
      expect(linked_list.head.value).to eq('another node')
    end
  end

  describe '#size' do
    it 'returns the size of the list' do
      linked_list.append('a node')
      expect(linked_list.size).to eq(1)
      linked_list.append('another node')
      expect(linked_list.size).to eq(2)
    end
  end

  describe '#head' do
    it 'returns the first node on the linked list' do
      linked_list.append('a node')
      expect(linked_list.head.value).to eq('a node')
      linked_list.prepend('another node')
      expect(linked_list.head.value).to eq('another node')
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
      linked_list.append('a node')
      linked_list.append('another node')
      expect(linked_list.at(1).value).to eq('another node')
      expect(linked_list.at(0).value).to eq('a node')
    end
  end

  describe '#pop' do
    it 'removes and returns the last element of the linked list' do
      linked_list.append('a node')
      linked_list.append('another node')
      expect(linked_list.size).to eq(2)
      expect(linked_list.pop.value).to eq('another node')
      expect(linked_list.size).to eq(1)
    end
  end

  describe '#contains?' do
    it 'returns true if any node in the linked list has the same value' do
      linked_list.append('a node')
      linked_list.append('another node')
      expect(linked_list.contains?('another node')).to eq(true)
      expect(linked_list.contains?('not a node')).to eq(false)
    end
  end

  describe '#find' do
    it 'returns the index of the node containing the specified value' do
      linked_list.append('a node')
      linked_list.append('another node')
      expect(linked_list.find('a node')).to eq(0)
      expect(linked_list.find('another node')).to eq(1)
      expect(linked_list.find('not a node')).to eq(nil)
    end
  end

  describe '#to_s' do
    before do
      linked_list.append('a node')
      linked_list.append('another node')
    end

    context 'prints all linked lists nodes' do
      specify { expect { linked_list.to_s }.to output('(a node) -> (another node) -> (nil) ').to_stdout }
    end
  end
end

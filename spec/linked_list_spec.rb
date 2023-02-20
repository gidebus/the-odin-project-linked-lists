# frozen_string_literal: true

require_relative '../lib/linked_list'
require_relative '../lib/node'


describe LinkedList do
  let(:linked_list) { LinkedList.new }
  let(:node) { Node.new('some value') }

  describe '#append' do
    it 'adds a node to the end of the list' do
      linked_list.append('some value')
      expect(linked_list.tail.value).to eq('some value')
    end
  end

  describe '#prepend' do
  end

  describe '#size' do
  end

  describe '#head' do
  end

  describe '#tail' do
  end

  describe '#at' do
  end

  describe '#pop' do
  end

  describe '#contains?' do
  end

  describe '#find' do
  end

  describe '#to_s' do
  end

end

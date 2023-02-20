# frozen_string_literal: true

require_relative '../lib/node'

describe Node do
  let(:second_node) { Node.new('second node') }
  let(:node) { Node.new('first node', second_node) }

  describe '#value' do
    it 'returns a value' do
      expect(node.value).to eq('first node')
    end
  end

  describe '#next_node' do
    it 'returns another node' do
      expect(node.next_node).to eq(second_node)
    end
  end
end

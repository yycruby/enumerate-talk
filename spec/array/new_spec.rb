require 'spec_helper'

RSpec.describe 'Array.new' do
  it 'builds an Array of specified length' do
    subject = Array.new(3)

    expect(subject).to eq [nil, nil, nil]
  end

  it 'builds an Array of specified length, with a default value' do
    subject = Array.new(3, 'abc123')

    expect(subject).to eq ['abc123', 'abc123', 'abc123']
  end

  it 'builds an Array of specified length with values from a block' do
    subject = Array.new(3) { |n| n + 1 }

    expect(subject).to eq [1, 2, 3]
  end

  it 'builds a new Array from another Array' do
    init = [1, 2, 3]
    subject = Array.new(init)

    expect(subject).to eq init
    expect(subject.object_id).to_not eq init.object_id
  end
end

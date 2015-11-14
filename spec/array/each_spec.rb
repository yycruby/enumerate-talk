require 'spec_helper'

RSpec.describe 'Array#each' do
  it 'yields each item to a block' do
    subject = [1, 2, 3]
    yielded = []

    subject.each do |n|
      yielded.push(n)
    end

    expect(yielded).to eq subject
  end

  it 'returns the array when a block is passed' do
    subject = [1, 2, 3]

    returned = subject.each do |n|
      # no-op
    end

    expect(returned).to eq subject
  end

  it 'returns an Enumerator when no block is passed' do
    subject = [1, 2, 3]

    returned = subject.each

    expect(returned).to be_an Enumerator
  end
end

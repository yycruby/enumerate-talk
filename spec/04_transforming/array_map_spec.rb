require 'spec_helper'

RSpec.describe Array, '#collect' do
  it 'returns a new Array' do
    subject = [1, 2, 3]
    result = subject.collect { |n| n }

    expect(result).to eq subject
    expect(result.object_id).to_not eq subject.object_id
  end

  it 'returns a new Array with values returned by the block' do
    subject = [1, 2, 3]
    result = subject.collect { |n| n * 2 }

    expect(result).to eq [2, 4, 6]
  end

  it 'returns an Enumerator when called with no block' do
    subject = [1, 2, 3]
    result = subject.collect

    expect(result).to be_an Enumerator
  end

  it 'returns the same result as Array#map' do
    subject = [1, 2, 3]
    collect_result = subject.collect { |n| n * 3 }
    map_result = subject.map { |n| n * 3 }

    expect(collect_result).to eq map_result
  end
end

RSpec.describe Array, '#collect!' do
  it 'replaces the contents of the Array' do
    subject = [1, 2, 3]
    subject.collect! { |n| n * 2 }

    expect(subject).to eq [2, 4, 6]
  end

  it 'returns the same Array' do
    subject = [1, 2, 3]
    result = subject.collect! { |n| n * 2 }

    expect(result.object_id).to eq subject.object_id
  end
end

require 'spec_helper'

RSpec.describe Array, '#collect' do
  it 'returns the same result as Array#map' do
    subject = [1, 2, 3]
    collect_result = subject.collect { |n| n * 3 }
    map_result = subject.map { |n| n * 3 }

    expect(collect_result).to eq map_result
  end
end

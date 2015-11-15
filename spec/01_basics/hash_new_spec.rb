require 'spec_helper'

RSpec.describe Hash, '.new' do
  it 'builds a Hash with a simple default value' do
    subject = Hash.new('value')

    expect(subject['a']).to eq 'value'
    expect(subject['b']).to eq 'value'
  end

  it 'does not cause all keys to be filled' do
    subject = Hash.new('value')
    subject['b'] = 'another value'

    expect(subject.key?('a')).to be false
    expect(subject.key?('b')).to be true
  end

  it 'shares a simple default value across keys' do
    subject = Hash.new([])
    subject['a'] << 1
    subject['b'] << 2

    expect(subject['a']).to eq [1, 2]
    expect(subject['b']).to eq [1, 2]
  end

  it 'builds a Hash with a default value from a block' do
    subject = Hash.new { [] }

    expect(subject['a']).to eq []
    expect(subject['b']).to eq []
  end

  it 'does not automatically persist the default value' do
    subject = Hash.new { [] }
    subject['a'] << 1
    subject['b'] << 2

    expect(subject['a']).to eq []
    expect(subject['b']).to eq []
  end

  it 'expects the block to store the default value' do
    subject = Hash.new { |h,k| h[k] = [] }
    subject['a'] << 1
    subject['b'] << 2

    expect(subject['a']).to eq [1]
    expect(subject['b']).to eq [2]
  end
end

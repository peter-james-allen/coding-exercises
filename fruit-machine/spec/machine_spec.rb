# frozen_string_literal: true

require 'machine'

describe Machine do
  it 'should return 4 slot spins of B, W, G or Y (default)' do
    result = subject.spin

    expect(result.length).to eq 4
    result.split('').each do |slot|
      expect(%w[B W G Y]).to include(slot)
    end
  end

  it 'should be able to set the number of slots' do
    machine = Machine.new(slots: 2)
    result = machine.spin

    expect(result.length).to eq 2
    result.split('').each do |slot|
      expect(%w[B W G Y]).to include(slot)
    end
  end

  it 'should be able to set the slot choices' do
    machine = Machine.new(choices: ['A'])
    result = machine.spin

    expect(result).to eq 'AAAA'
  end

  it 'should have a balance of 100 by default' do
    expect(subject.balance).to eq 100
  end

  it 'should be able to set the balance' do
    machine = Machine.new(balance: 50)

    expect(machine.balance).to eq 50
  end

  it 'should be able to win the jackpot which is all money stored' do
    winnings = subject.pay_out
    expect(winnings).to eq 100
    expect(subject.balance).to eq 0
  end

  it 'should be able to bet and lose 1 by default' do
    subject.pay_in
    expect(subject.balance).to eq 101
  end

  it 'should be able to bet and lose any amount' do
    subject.pay_in(10)
    expect(subject.balance).to eq 110
  end
end

# frozen_string_literal: true

require 'game'
require 'machine'

describe Game do
  it 'should take a player name' do
    game = Game.new(player: 'Pete')
    expect(game.player).to eq 'Pete'
  end

  it 'should have a default balance of 100' do
    game = Game.new(player: 'Pete')
    expect(game.balance).to eq 100
  end

  it 'should be able to set the balance when initalized' do
    game = Game.new(player: 'Pete', balance: 50)
    expect(game.balance).to eq 50
  end

  it 'should have a machine set by default' do
    game = Game.new(player: 'Pete')
    expect(game.machine).to be_a(Machine)
  end

  context 'when you take a turn and lose' do
    let(:machine_class) { double :machine_class, new: machine }
    let(:machine) { double :machine, spin: 'BWGY', pay_in: true }

    it 'should reduce the balance by one' do
      game = Game.new(player: 'Pete', machine_class: machine_class)
      expect { game.turn }.to change { game.balance }.by(-1)
    end
  end

  context 'when you take a turn and win' do
    let(:machine_class) { double :machine_class, new: machine }
    let(:machine) { double :machine, spin: 'BBBB', pay_out: 100, pay_in: true }

    it 'should reduce the balance by one' do
      game = Game.new(player: 'Pete', machine_class: machine_class)
      expect { game.turn }.to change { game.balance }.by 100
    end
  end
end

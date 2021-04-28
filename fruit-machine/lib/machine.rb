# frozen_string_literal: true

class Machine
  DEFAULT_CHOICES = %w[B W G Y].freeze
  DEFAULT_SLOTS = 4
  DEFAULT_BET = 1

  attr_reader :balance

  def initialize(slots: DEFAULT_SLOTS, choices: DEFAULT_CHOICES, balance: 100)
    @choices = choices
    @slots = slots
    @balance = balance
  end

  def spin
    (1..@slots).collect { @choices.sample }.join('')
  end

  def pay_in(bet = DEFAULT_BET)
    @balance += bet
  end

  def pay_out
    winnings = @balance
    @balance = 0
    winnings
  end
end

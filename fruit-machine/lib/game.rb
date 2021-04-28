# frozen_string_literal: true

class Game
  attr_reader :player, :balance, :machine

  def initialize(player: player_name, balance: 100, machine_class: Machine)
    @player = player
    @balance = balance
    @machine = machine_class.new
    @result = ''
  end

  def turn(bet = 1)
    @machine.pay_in(bet)
    @result = @machine.spin
    puts @result
    win? ? @balance += @machine.pay_out : @balance -= bet
  end

  private

  def win?
    @result.split('').uniq.length == 1
  end
end

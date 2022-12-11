# frozen_string_literal: true

module ExchangeIt
  class Account
    include ExchangeIt::Utils::Uid
    attr_reader :uid, :balance

    def initialize(user)
      @uid = hash(user.name, user.lastname)
      @balance = 0
    end

    def transfer(recipient, amount)
      withdraw amount
      recipient.deposit amount
    end

    def withdraw(amount)
      raise ExchangeIt::AmountNotPositiveError unless amount.positive?
      raise ExchangeIt::BalanceLessThanAmountError if @balance < amount

      @balance -= amount
    end

    def deposit(amount)
      raise ExchangeIt::AmountNotPositiveError unless amount.positive?

      @balance += amount
    end
  end
end

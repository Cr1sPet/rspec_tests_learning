# frozen_string_literal: true

module ExchangeIt
  class User
    extend Forwardable
    attr_reader :name, :lastname, :account

    def_delegators :account, :balance
    def initialize(name, lastname)
      @name = name.to_s
      @lastname = lastname.to_s
      create_account
    end

    private

    def create_account
      @account = Account.new self
    end
  end
end

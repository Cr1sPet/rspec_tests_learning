# frozen_string_literal: true

module ExchangeIt
  class User
    attr_reader :name, :lastname

    def initialize(name, lastname)
      @name = name.to_s
      @lastname = lastname.to_s
    end
  end
end

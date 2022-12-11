# frozen_string_literal: true

module ExchangeIt
  class AmountNotPositiveError < StandardError
    def initialize(msg = 'Amount should be positive')
      super
    end
  end

  class BalanceLessThanAmountError < StandardError
    def initialize(msg = 'Balance must be greater than amount')
      super
    end
  end
end

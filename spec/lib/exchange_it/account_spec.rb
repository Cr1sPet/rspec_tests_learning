# frozen_string_literal: true

require 'pry-byebug'

RSpec.describe ExchangeIt::Account do
  let(:user) { Struct.new(:name, :lastname) }
  let(:bob_account) { described_class.new(user.new('Bob', 'Marlie')) }
  let(:greg_account) { described_class.new(user.new('Greg', 'Robbins')) }

  it 'returns zero balance' do
    expect(bob_account.balance).to eq(0)
  end

  it 'returns uid as String' do
    expect(bob_account.uid).to be_an_instance_of(String)
  end

  it 'returns proper hash' do
    expect(bob_account.uid).to eq(bob_account.hash('Bob', 'Marlie'))
  end

  describe '#transfer' do
    before { bob_account.instance_variable_set(:@balance, 100) }

    it 'transfers' do
      bob_account.transfer(greg_account, 90)
      expect(bob_account.balance).to eq(10)
      expect(greg_account.balance).to eq(90)
    end

    describe '#withdraw' do
      context 'when valid params' do
        it 'withdraws' do
          expect(bob_account.withdraw(51)).to eq(49)
        end
      end

      context 'when invalid params' do
        it 'raises ExchangeIt::AmountNotPositiveError when amount <= 0' do
          expect { bob_account.withdraw(0) }.to raise_error(ExchangeIt::AmountNotPositiveError)
          expect { bob_account.withdraw(-1) }.to raise_error(ExchangeIt::AmountNotPositiveError)
        end

        it 'raises ExchangeIt::BalanceLessThanAmountError when amount > balance' do
          expect { bob_account.withdraw(101) }.to raise_error(ExchangeIt::BalanceLessThanAmountError)
        end
      end
    end

    describe '#deposit' do
      context 'when valid params' do
        it 'deposits' do
          bob_account.deposit(50)
          expect(bob_account.balance).to eq(150)
        end
      end

      context 'when invalid params' do
        it 'raises ExchangeIt::AmountNotPositiveError when amount <= 0' do
          expect { bob_account.deposit(0) }.to raise_error(ExchangeIt::AmountNotPositiveError)
          expect { bob_account.deposit(-1) }.to raise_error(ExchangeIt::AmountNotPositiveError)
        end
      end
    end
  end
end

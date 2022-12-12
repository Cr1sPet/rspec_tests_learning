# frozen_string_literal: true

RSpec.describe ExchangeIt::User do
  let(:user) { |ex| described_class.new(ex.metadata[:name] || 'Bob', ex.metadata[:lastname] || 'Marlie') }
  let(:user_no_string_lastname) { described_class.new 'Bob', 10 }

  fit 'returns correct name' do
    expect(user.name).to eq('Bob')
  end

  fit 'returns correct lastname' do
    expect(user.lastname).to eq('Marlie')
  end

  it 'returns name as a String', name: nil do
    expect(user.name).to be_an_instance_of(String)
  end

  it 'returns lastname as a String', lastname: 10 do
    expect(user_no_string_lastname.lastname).to be_an_instance_of(String)
  end

  fspecify '#account' do
    expect(user.account).to be_an_instance_of(ExchangeIt::Account)
  end

  it 'has zero balance by default' do
    expect(user.balance).to eq(0)
  end
end

# frozen_string_literal: true

RSpec.describe ExchangeIt::User do
  let(:user) { described_class.new 'Bob', 'Marlie' }
  let(:user_no_string_name) { described_class.new nil, 'Marlie' }
  let(:user_no_string_lastname) { described_class.new 'Bob', 10 }

  it 'returns correct name' do
    expect(user.name).to eq('Bob')
  end

  it 'returns correct lastname' do
    expect(user.lastname).to eq('Marlie')
  end

  it 'returns name as a String' do
    expect(user_no_string_name.name).to be_an_instance_of(String)
  end

  it 'returns lastname as a String' do
    expect(user_no_string_lastname.lastname).to be_an_instance_of(String)
  end

  specify '#account' do
    expect(user.account).to be_an_instance_of(ExchangeIt::Account)
  end

  it 'has zero balance by default' do
    expect(user.balance).to eq(0)
  end
end

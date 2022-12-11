# frozen_string_literal: true

RSpec.describe ExchangeIt::User do
  let(:user) { described_class.new 'Bob', 'Marlie' }
  let(:user_no_string_name) { described_class.new nil, 'Marlie' }
  let(:user_no_string_lastname) { described_class.new 'Bob', 10 }

  it 'returns user with correct name' do
    expect(user.name).to eq('Bob')
  end

  it 'returns user with correct lastname' do
    expect(user.lastname).to eq('Marlie')
  end

  it 'returns user with name as a String' do
    expect(user_no_string_name.name).to be_an_instance_of(String)
  end

  it 'returns user with lastname as a String' do
    expect(user_no_string_lastname.lastname).to be_an_instance_of(String)
  end
end

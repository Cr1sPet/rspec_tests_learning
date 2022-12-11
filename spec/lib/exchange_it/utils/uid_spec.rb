# frozen_string_literal: true

RSpec.describe ExchangeIt::Utils::Uid do
  let(:dummy) { Class.new { include ExchangeIt::Utils::Uid }.new }

  describe '#hash' do
    it 'returns nil if args nil' do
      expect(dummy.hash(nil)).to be_nil
    end

    it 'returns String if at least one arg is given' do
      expect(dummy.hash('val')).to be_an_instance_of(String)
    end
  end
end

require 'rails_helper'

RSpec.describe MainBook, type: :model do
  context 'when user is creating entry in mainbook' do
    it 'is not allowed without date input' do
      mainbook_entry = described_class.new(date_mainb: nil, mainbook_description: 'Payment for AC', or_vat_reg_tin_mainb: 'abcde123', debit_mainb: 15_000, credit_mainb: 11_990.50, balance_mainb: 3009.50)
      expect(mainbook_entry).not_to be_valid
    end

    it 'is not allowed without mainbook entry description' do
      mainbook_entry = described_class.new(date_mainb: Time.zone.today, mainbook_description: nil, or_vat_reg_tin_mainb: 'abcde123', debit_mainb: 15_000, credit_mainb: 11_990.50, balance_mainb: 3009.50)
      expect(mainbook_entry).not_to be_valid
    end

    it 'is not allowed without mainbook entry or vat reg tin' do
      mainbook_entry = described_class.new(date_mainb: Time.zone.today, mainbook_description: 'Payment for AC', or_vat_reg_tin_mainb: nil, debit_mainb: 15_000, credit_mainb: 11_990.50, balance_mainb: 3009.50)
      expect(mainbook_entry).not_to be_valid
    end
  end

  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:date_mainb) }
    it { is_expected.to validate_presence_of(:mainbook_description) }
    it { is_expected.to validate_presence_of(:or_vat_reg_tin_mainb) }
  end

  context 'when validating associations' do
    it { is_expected.to belong_to(:user) }
  end
end

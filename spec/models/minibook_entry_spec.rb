require 'rails_helper'

RSpec.describe MinibookEntry, type: :model do
  context 'when user is creating entry in minibook' do
    it 'is not allowed without date input' do
      minibook_entry = described_class.new(date_minib_entry: nil, minibook_entry_description: 'electronics', or_vat_reg_tin_minib: 'abcde123', debit_minib: 1000.00, credit_minib: 600.00, minibook_balance: 400.00)
      expect(minibook_entry).not_to be_valid
    end

    it 'is not allowed without minibook entry description' do
      minibook_entry = described_class.new(date_minib_entry: Time.zone.today, minibook_entry_description: nil, or_vat_reg_tin_minib: 'abcde123', debit_minib: 1000.00, credit_minib: 600.00, minibook_balance: 400.00)
      expect(minibook_entry).not_to be_valid
    end

    it 'is not allowed without minibook entry or vat tin' do
      minibook_entry = described_class.new(date_minib_entry: Time.zone.today, minibook_entry_description: 'electronics', or_vat_reg_tin_minib: nil, debit_minib: 1000.00, credit_minib: 600.00, minibook_balance: 400.00)
      expect(minibook_entry).not_to be_valid
    end
  end

  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:date_minib_entry) }
    it { is_expected.to validate_presence_of(:minibook_entry_description) }
    it { is_expected.to validate_presence_of(:or_vat_reg_tin_minib) }
  end

  context 'when validating associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:mini_book) }
  end
end

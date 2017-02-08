require 'rails_helper'

RSpec.describe Listing, type: :model do
  context 'no section eight' do
    it 'marks it as illegal' do
      listing = build(:listing, description: 'No section eight')
      expect(listing.illegal?).to be_truthy
    end
  end
  context 'professionals only' do
    it 'marks it as illegal' do
      listing = build(:listing, description: 'professionals only')
      expect(listing.illegal?).to be_truthy
    end
  end
  context 'no students' do
    it 'marks it as illegal' do
      listing = build(:listing, description: 'no students')
      expect(listing.illegal?).to be_truthy
    end
  end
  context 'no couples' do
    it 'marks it as illegal' do
      listing = build(:listing, description: 'no couples')
      expect(listing.illegal?).to be_truthy
    end
  end
end

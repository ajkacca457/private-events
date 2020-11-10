require 'rails_helper'
RSpec.describe Event, type: :model do
  let(:title_invalid) { Event.new(description: 'test description', date: Time.now, user_id: 1) }
  let(:description_invalid) { Event.new(title: 'test title', date: Time.now, user_id: 1) }
  let(:date_invalid) { Event.new(title: 'test title', description: 'test description', user_id: 1) }
  let(:id_invalid) { Event.new(title: 'test title', description: 'test description', date: Time.now) }

  context 'Association Test' do
    it 'has many to attendances' do
      expect(Event.reflect_on_association(:attendances).macro).to be :has_many
    end

    it 'belongs to users' do
      expect(Event.reflect_on_association(:creator).macro).to be :belongs_to
    end
  end

  context 'Validations tests' do
    it 'return false if title is invalid or not given' do
      expect(title_invalid.valid?).to eq(false)
    end

    it 'Returns false when the Description is not present' do
      expect(description_invalid.valid?).to eq(false)
    end

    it 'Returns false when the date is not present' do
      expect(date_invalid.valid?).to eq(false)
    end

    it 'Returns false when the id is not present' do
      expect(id_invalid.valid?).to eq(false)
    end
  end
end

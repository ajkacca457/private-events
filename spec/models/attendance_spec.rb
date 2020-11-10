require 'rails_helper'
RSpec.describe Attendance, type: :model do
  context 'Association Test' do
    it 'belongs to users' do
      expect(Attendance.reflect_on_association(:attendee).macro).to be :belongs_to
    end

    it 'belongs to events' do
      expect(Attendance.reflect_on_association(:attended_event).macro).to be :belongs_to
    end
  end
end

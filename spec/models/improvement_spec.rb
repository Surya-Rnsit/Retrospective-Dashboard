require 'rails_helper'

RSpec.describe Improvement, type: :model do
  subject do
    @sprint = Sprint.create(id: 1, name: 'firstsprint')
    described_class.new(id: 1,
                        body: 'Anything',
                        sprint_id: @sprint.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a body' do
    subject.body = nil
    expect(subject).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Sprint, type: :model do
  subject do
    described_class.new(id: 1,
                        name: 'Anything')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without sprint' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Sprint, type: :model do
  subject {
    described_class.new(id:1,
                        name: "Anything",
                        )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without sprint" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

end

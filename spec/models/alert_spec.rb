require 'spec_helper'

RSpec.describe "Alerts API", type: :model do
  subject { Alert.new(level: 10, user_id: 1, id: 1000)}  

  before { subject.save }

  it "is valid with level, user_id, and id" do
    expect(subject).to be_valid
  end
  it "is not valid without a level" do
    subject.level=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a user_id" do
    subject.user_id=nil
    expect(subject).to_not be_valid
  end
end

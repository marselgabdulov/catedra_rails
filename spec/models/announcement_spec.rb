require 'rails_helper'

RSpec.describe Announcement, type: :model do
  before(:each) do
    @announcement = create(:announcement)
  end

  it "validates title presence" do
    @announcement.valid?
    expect(@announcement.errors[:title]).to be_empty
  end

  it "validates body presence" do
    @announcement.valid?
    expect(@announcement.errors[:body]).to be_empty
  end
end

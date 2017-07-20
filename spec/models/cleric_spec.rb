require 'rails_helper'

RSpec.describe Cleric, type: :model do
  before(:each) do
    @cleric = create(:cleric)
  end

  it "validates name presence" do
    @cleric.valid?
    expect(@cleric.errors[:name]).to be_empty
  end

  it "validates position presence" do
    @cleric.valid?
    expect(@cleric.errors[:position]).to be_empty
  end
end

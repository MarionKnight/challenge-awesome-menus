require 'spec_helper'
describe MenuItem do
  context "#validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  context "#associations" do
    it { should belong_to :menu}
  end

end



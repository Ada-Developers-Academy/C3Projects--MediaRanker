require 'rails_helper'

RSpec.shared_examples "a medium" do
  let(:medium) {described_class.new}


    it "requires a name, all the time" do
      # testing that it's failing b/c title is required
      expect(@medium).to_not be_valid
      expect(@medium.errors.keys).to include(:name)
    end

end

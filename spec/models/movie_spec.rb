require 'rails_helper'
require 'support/shared_examples_for_media'

RSpec.describe Movie, type: :model do
  describe Movie do
    it_behaves_like "a medium"
  end
end

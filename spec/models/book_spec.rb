require 'rails_helper'
require 'support/shared_examples_for_media'

RSpec.describe Book, type: :model do
  describe Book do
    it_behaves_like "a medium"
  end
end

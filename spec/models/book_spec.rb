require 'rails_helper'

RSpec.describe Book, type: :model do

  describe Book do
    it_behaves_like "a medium"
  end

end

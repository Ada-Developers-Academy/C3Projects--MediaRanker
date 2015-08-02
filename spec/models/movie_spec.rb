require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe Movie do
    it_behaves_like "a medium"
  end

end

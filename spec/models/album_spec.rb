require 'rails_helper'

RSpec.describe Album, type: :model do
  describe Album do
    it_behaves_like "a medium"
  end
end

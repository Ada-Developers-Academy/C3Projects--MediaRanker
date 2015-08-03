require 'rails_helper'

RSpec.describe Book, type: :model do
  it_behaves_like "a media"
end

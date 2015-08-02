require 'rails_helper'
require 'support/shared_model_examples'

RSpec.describe Book, type: :model do
  it_behaves_like "medium"
end

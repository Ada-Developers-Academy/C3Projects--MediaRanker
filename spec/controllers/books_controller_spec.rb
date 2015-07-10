require 'rails_helper'
require 'support/shared_examples_for_media_controllers'

RSpec.describe BooksController, type: :controller do
  let(:model) { Book }

  it_behaves_like "a MediumController"
end

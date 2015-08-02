require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let (:model) { Album }

    it_behaves_like "a media"
  end



  # describe "PATCH update" do
  #   before :each do
  #     @album1 = Album.new(id: 1, name: "any old name")
  #     @album1.save
  #   end

  #   it "updates an existing record" do
  #       original_name = @album1.name
  #       patch :update, id: @album1.id, album: { id: 1, name: "A new name" }
  #       @album1.reload


  #       expect(@album1.name).to_not eq original_name
  #   end
  # end
# end

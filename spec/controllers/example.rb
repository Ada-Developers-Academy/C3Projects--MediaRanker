describe "POST #create" do
    # positive test - album params are validate
    context "Valid album params" do
      let(:album_params) do
        {
          album: {
            title: "a title",
            label_code: "b label",
            format: "c format",
            released_year: "1990"
          }
        }
      end

      it "creates an Album record" do
        post :create, album_params
        expect(Album.count).to eq 1
      end

      it "redirects to the album show page" do
        post :create, album_params
        expect(subject).to redirect_to(album_path(assigns(:album)))
      end
    end

    # neg test - album params are invalid
    context "Invalid album params" do
      let(:album_params) do
        {
          album: {
            # this is invalid because it's missing the title key
            label_code: "b label",
            format: "c format",
            released_year: "1990"
          }
        }
      end

      it "does not create a new Album record" do
        post :create, album_params
        expect(Album.count).to eq 0
      end

      it "renders the album :new view (allows users to fix invalid data)" do
        post :create, album_params
        expect(response).to render_template("new")
      end
    end

  end

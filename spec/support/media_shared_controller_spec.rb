RSpec.shared_examples "a media controller" do
  let(:media) { described_class.new }

  describe "GET" do
    context "#index" do
      it "responds sucessfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "#new" do
      it "responds sucessfully with an HTTP 200 status code" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "#edit" do
      it "responds sucessfully with an HTTP 200 status code" do
        media = described_class.model.create(name: 'whatever')

        get :edit, {:id => '1'}
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "#show" do
      it "responds sucessfully with an HTTP 200 status code" do
        media = described_class.model.create(name: 'whatever')

        get :edit, {:id => '1'}
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

  end
end

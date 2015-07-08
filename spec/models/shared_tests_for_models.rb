shared_examples "a media model" do
    [:title, :votes, :description].each do |method_name|
      it { is_expected.to respond_to method_name}
    end
end

require 'rails_helper'
RSpec.describe ShortenedUrlsHelper, type: :helper do
  describe "#unique_string" do
  let(:shortened_url) { ShortenedUrl.new }
    context "if string generated by random generator is not unique" do
      it "generates a new random string" do
        allow(ShortenedUrl).to receive(:exists?).and_return(true, false)
        expect(SecureRandom).to receive(:hex).with(4).twice
        helper.unique_string
      end
    end
    context "when string generated by random generator is unique" do
      it "returns the string" do
        unique_string = "abcd1234"
        allow(SecureRandom).to receive(:hex).and_return(unique_string)
        allow(ShortenedUrl).to receive(:exists?).and_return(false)
        output = helper.unique_string
        expect(output).to eq(unique_string)
      end
    end
  end
end
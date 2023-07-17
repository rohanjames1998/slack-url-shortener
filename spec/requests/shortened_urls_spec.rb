require 'rails_helper'

RSpec.describe "ShortenedUrls", type: :request do

  describe "GET redirect" do
    context "When url is found" do
      it "redirects to the full url" do
        short_url = "abcd"
        full_url = "https://www.example.com"
        ShortenedUrl.create(short_url: short_url, full_url: full_url)

        get "/#{short_url}"

        expect(response).to redirect_to(full_url)
      end
    end
    context "When url is not found" do
      it "responds with http status 404" do
        non_existent_short_url = "xyz"

        get shortened_urls_path(non_existent_short_url)

        expect(response).to be_not_found
      end
    end
  end
end

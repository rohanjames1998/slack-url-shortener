require 'rails_helper'
require 'securerandom'

RSpec.describe ShortenedUrl, type: :model do
  describe "validations" do
    # Subject is explicitly defined to avoid PG::NotNullViolation error caused of validate_uniqueness_of matcher.
    subject { ShortenedUrl.new(full_url: "https://www.example.com", short_url: "abcdefg")}
    it { should validate_presence_of(:full_url) }
    it { should validate_uniqueness_of(:full_url) }
    it { should validate_presence_of(:short_url) }
    it { should validate_uniqueness_of(:short_url) }
  end
end


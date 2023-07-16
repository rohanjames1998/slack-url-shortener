class ShortenedUrl < ApplicationRecord
  validates :full_url, url: true, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true # Short url is not a full url rather works as an unique identifier
end

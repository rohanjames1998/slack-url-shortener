class ShortenedUrl < ApplicationRecord
  validates :full_url, url: true, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true # Short url is not an actual url it rather works as an unique identifier

  def add_short_url
    self.short_url = unique_string
  end

  def unique_string
    # This loop is to make sure no two links have the same short url
    loop do
      unique_string = SecureRandom.hex(4)
      next if ShortenedUrl.exists?(short_url: unique_string)
      return unique_string
    end
  end
end

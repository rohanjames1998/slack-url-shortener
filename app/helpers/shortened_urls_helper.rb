module ShortenedUrlsHelper
  def unique_string
    # This loop is to make sure no two links have the same short url
    loop do
      unique_string = SecureRandom.hex(4)
      next if ShortenedUrl.exists?(short_url: unique_string)
      return unique_string
    end
  end
end

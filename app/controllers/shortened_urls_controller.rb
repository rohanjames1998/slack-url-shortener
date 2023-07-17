class ShortenedUrlsController < ApplicationController
  def create
    shortened_url = ShortenedUrl.new(full_url: params[:text])
    shortened_url.add_short_url

    if shortened_url.save
      SlackClient.web_client.chat_postMessage(channel: params[:channel_name],
      text: "https://bddd-103-83-145-175.ngrok-free.app/#{shortened_url.short_url}")
    end
  end
end

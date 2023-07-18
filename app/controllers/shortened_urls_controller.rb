class ShortenedUrlsController < ApplicationController
  def create
    short_url = helpers.unique_string
    shortened_url = ShortenedUrl.find_or_create_by(full_url: params[:text], short_url: short_url)
    if shortened_url.save
      SlackClient.web_client.chat_postMessage(channel: params[:channel_name],
      text: "https://bddd-103-83-145-175.ngrok-free.app/#{shortened_url.short_url}")
    end
  end

  def redirect
    if ShortenedUrl.exists?(short_url: params[:short_url])
      redirect_url = ShortenedUrl.find_by(short_url: params[:short_url]).full_url
      redirect_to redirect_url, allow_other_host: true
    else
      render :no_url, status: :not_found
    end
  end

end

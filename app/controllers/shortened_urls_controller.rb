class ShortenedUrlsController < ApplicationController

  def create
    return if url_found?(params[:text], params[:channel_name])
    short_url = helpers.unique_string
    shortened_url = ShortenedUrl.new(full_url: params[:text], short_url: short_url)
    if shortened_url.save
      SlackClient.web_client.chat_postMessage(channel: params[:channel_name],
      text: "https://3a43-103-83-145-211.ngrok-free.app/#{shortened_url.short_url}")
    else
      SlackClient.web_client.chat_postMessage(channel: params[:channel_name],
      text: "An unexpected error occurred. Please check the url provided.")
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

  private
  def url_found?(full_url, channel_name)
    if ShortenedUrl.exists?(full_url: full_url)
      shortened_url = ShortenedUrl.find_by(full_url: full_url)
      SlackClient.web_client.chat_postMessage(channel: channel_name,
      text: "https://3a43-103-83-145-211.ngrok-free.app/#{shortened_url.short_url}")
      # returning true if the url already exists in the database
      true
    else
      false
    end
  end
end

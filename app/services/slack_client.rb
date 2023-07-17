module SlackClient

  def web_client
    client = Slack::Web::Client.new
    client.auth_test
  rescue Slack::Web::Api::Errors::InvalidAuth
    "App Authentication Failed"
  else
    client
  end

  module_function :web_client
end


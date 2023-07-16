Slack.configure do |config|
  config.token = Rails.application.credentials.slack_token
end

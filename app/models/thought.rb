class Thought < ActiveRecord::Base
  after_create :notify_slack

  validates :body, presence: true

  def notify_slack
    payload = {
      username: thinker.present? ? thinker : "Randy Rando",
      text: body,
      icon_emoji: ":intriguing:"
    }
    payload[:channel] = Rails.env.development? ? "@neil" : "#ideas"
    HTTPClient.post("https://hooks.slack.com/services/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", { payload: payload.to_json})
  end
end

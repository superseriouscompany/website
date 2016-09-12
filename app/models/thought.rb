class Thought < ActiveRecord::Base
  after_create :notify_slack

  def notify_slack
    HTTPClient.post("https://hooks.slack.com/services/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", { payload: {username: thinker || "Randy Rando",  text: body, icon_emoji: ":intriguing:"}.to_json })
  end
end

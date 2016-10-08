class Subscription < ActiveRecord::Base
  def self.notify_all
    ids = all.map(&:fcm_id)
    return false unless ids.present?

    payload = {
      registration_ids: ids
    }
    headers = {
      "Authorization" => 'key=AIzaSyC1HZtvMnW0ft7wrYqlvb61QFO6hXNQWZU',
      "Content-Type" => 'application/json'
    }

    HTTPClient.post("https://android.googleapis.com/gcm/send", payload.to_json, headers)

    [x.status, x.body]
  end
end

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

    response = HTTPClient.post("https://android.googleapis.com/gcm/send", payload.to_json, headers)

    [response.status, response.body]
  end

  def notify
    payload = {
      registration_ids: [fcm_id]
    }
    headers = {
      "Authorization" => 'key=AIzaSyC1HZtvMnW0ft7wrYqlvb61QFO6hXNQWZU',
      "Content-Type" => 'application/json'
    }

    response = HTTPClient.post("https://android.googleapis.com/gcm/send", payload.to_json, headers)

    [response.status, response.body]
  end
end

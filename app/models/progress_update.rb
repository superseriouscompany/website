class ProgressUpdate < ActiveRecord::Base
  belongs_to :project

  def create_thumbnail
    payload = { url: image_url }
    headers = {
      "Content-Type" => 'application/json'
    }
    resp = HTTPClient.post("https://90gkxhh9u7.execute-api.us-west-2.amazonaws.com/Production", payload.to_json, headers)
    update_attribute :thumbnail_url, JSON.parse(resp.body)["url"]
  end
end

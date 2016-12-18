class BackfillThumbnails

  def self.execute
    # ProgressUpdate.all.map {|w| { id: w.id, project_id: w.project_id, image_url: w.image_url}}
    thumbnails = [
      {:id=>1, :project_id=>"2", :image_url=>"https://superseriouscompany.com/assets/progress0-e18446161cce46795c60b16d148c69340ffd48032de79ebab65cbc4f7f883ab8.jpg"},
      {:id=>2, :project_id=>"2", :image_url=>"https://superseriouscompany.com/assets/progress1-52520f3bb7c61f23d07eb4371d5e4434aca5a714c5934c5ce6c3a6ebe547389b.jpg"},
      {:id=>4, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/a9d299d0-9000-11e6-a240-e3923eefc504.jpg"},
      {:id=>5, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/d44b4040-9000-11e6-a240-e3923eefc504.jpg"},
      {:id=>6, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/e3c11360-9000-11e6-a240-e3923eefc504.png"},
      {:id=>7, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/c1753290-91aa-11e6-91a6-b7a2a60a6593.gif"},
      {:id=>8, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/6af63a10-9b1c-11e6-9ad1-abe406856670.png"},
      {:id=>9, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/abdbd8f0-9bd5-11e6-9ad1-abe406856670.png"},
      {:id=>10, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/6e18d450-a3c3-11e6-b94d-118bebcd2c92.png"},
      {:id=>11, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/70dc47d0-a3c8-11e6-b94d-118bebcd2c92.png"},
      {:id=>12, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/0ba67d70-b4f0-11e6-92d2-4df63fad9cef.jpg"},
      {:id=>13, :project_id=>"2", :image_url=>"https://image.superseriouscompany.com/58bdcfd0-b68c-11e6-ab32-93c248dc6437.png"}
    ]

    thumbnails.each do |t|
      upload t
    end
  end

  def self.upload(t)
    payload = { url: t[:image_url] }
    headers = {
      "Content-Type" => 'application/json'
    }

    resp = HTTPClient.post("https://90gkxhh9u7.execute-api.us-west-2.amazonaws.com/Production", payload.to_json, headers)

    payload = {progress_update: {thumbnail_url: JSON.parse(resp.body)["url"]}}
    puts payload
    base_url = Rails.env.production? ? 'https://superseriouscompany.com' : 'http://localhost:3000'

    HTTPClient.post("#{base_url}/progress_updates/#{t[:id]}", payload.to_json, headers)
  end
end

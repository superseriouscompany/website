#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Super Serious Company"
    xml.author "Neil and Santi"
    xml.description "Surfing, Vacations, Panicked Bursts of Work."
    xml.link "https://superseriouscompany.com"
    xml.language "en"

    for day in @days
      xml.item do
        xml.title day.portuguese_title

        xml.author "Neil and Santi"
        xml.pubDate day.created_at.to_s(:rfc822)
        xml.link "https://superseriouscompany.com/dias/#{day.id}"
        xml.guid day.id

        image_tag = "<p><img src=\"#{day.image_url}\" alt=\"Comic of the day\" />"

        if day.order == 'neil'
          text = """
            #{image_tag}
            <p>Neil: #{day.neil_quote}</p>
            <p>Santi: #{day.santi_quote}</p>
          """
        else
          text = """
            #{image_tag}
            <p>Santi: #{day.santi_quote}</p>
            <p>Neil: #{day.neil_quote}</p>
          """
        end

        xml.description text
      end
    end
  end
end

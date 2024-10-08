require 'net/http'
require 'uri'
require 'json'

module Jekyll
  class MTGCardLink < Liquid::Tag
    def initialize(tag_name, card_name, tokens)
      super
      @card_name = card_name.strip
    end

    def render(context)
      card_data = fetch_card_data(@card_name)

      if card_data.nil?
        return "Card not found: #{@card_name}"
      end

      card_url = card_data["scryfall_uri"]

      if card_data["layout"] == "transform"
        # Display both faces of the card side by side
        image_url_front = card_data["card_faces"][0]["image_uris"]["normal"]
        image_url_back = card_data["card_faces"][1]["image_uris"]["normal"]

        html_output = <<~HTML
        <a href="#{card_url}" target="_blank">#{escape_html(@card_name)}
        <span class="hover-image"  style="display: flex;">
            <img src="#{image_url_front}" alt="#{escape_html(@card_name)} - Front" />
            <img src="#{image_url_back}" alt="#{escape_html(@card_name)} - Back" />
        </span>
        </a>
        HTML

      else
        # Normal layout, single face
        image_url = card_data["image_uris"]["normal"]
        card_url = card_data["scryfall_uri"]

        html_output = <<~HTML
        <a href="#{card_url}" target="_blank">#{escape_html(@card_name)}
        <span class="hover-image">
          <img src="#{image_url}" alt="#{escape_html(@card_name)}" height="311" width="223">
        </span>
        </a>
        HTML
      end

      html_output.strip
    end

    private

    def fetch_card_data(card_name)
      encoded_name = URI.encode_www_form_component(card_name) # Properly encode the card name
      uri = URI.parse("https://api.scryfall.com/cards/named?fuzzy=#{encoded_name}")
      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body)
      else
        nil
      end
    end

    def escape_html(text)
      CGI.escapeHTML(text)
    end
  end
end

Liquid::Template.register_tag('mtg_card_link', Jekyll::MTGCardLink)

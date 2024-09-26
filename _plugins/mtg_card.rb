require 'net/http'
require 'uri'
require 'json'

module Jekyll
  class MTGCardTag < Liquid::Tag
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
      image_url = card_data["image_uris"]["normal"]

      html_output = <<~HTML
      <div class="mtg-card">
        <a href="#{card_url}" target="_blank">
          <img src="#{image_url}" alt="#{escape_html(@card_name)}" />
        </a>
      </div>
      HTML

      html_output.strip
    end

    private

    def fetch_card_data(card_name)
      encoded_name = URI.encode_www_form_component(card_name) # Properly encode the card name
      uri = URI.parse("https://api.scryfall.com/cards/named?fuzzy=#{encoded_name}")
      #uri = URI.parse("https://api.scryfall.com/cards/named?fuzzy=#{CGI.escape(card_name)}")
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

Liquid::Template.register_tag('mtg_card', Jekyll::MTGCardTag)

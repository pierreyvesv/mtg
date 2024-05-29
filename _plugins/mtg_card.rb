module Jekyll
    class MTGCardTag < Liquid::Tag
      def initialize(tag_name, card_name, tokens)
        super
        @card_name = card_name.strip
      end
  
      def render(context)
        card_url = "https://scryfall.com/card/search?q=#{CGI.escape(@card_name)}"
        image_url = "https://api.scryfall.com/cards/named?fuzzy=#{CGI.escape(@card_name)}&format=image"
  
        <<~HTML
        <div class="mtg-card">
          <a href="#{card_url}" target="_blank">
            <img src="#{image_url}" alt="#{@card_name}" />
            #{@card_name}
          </a>
        </div>
        HTML
      end
    end
  end
  
  Liquid::Template.register_tag('mtg_card', Jekyll::MTGCardTag)
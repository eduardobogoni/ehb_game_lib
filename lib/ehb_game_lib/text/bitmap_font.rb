# frozen_string_literal: true

module EhbGameLib
  module Text
    class BitmapFont
      attr_reader :name, :line_height

      def initialize(name, line_height)
        @name = name
        @line_height = line_height
      end

      def image(text)
        ::Gosu::Image.from_text(text, line_height, retro: true, font: name)
      end
    end
  end
end

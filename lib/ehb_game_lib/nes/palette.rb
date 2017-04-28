module EhbGameLib
  module Nes
    class Palette
      COLORS_COUNT = 16

      def initialize(all_colors)
        @colors = Array.new(COLORS_COUNT) { |i| ::EhbGameLib::Nes::Color.new(all_colors, i) }
      end

      def [](index)
        @colors[index % @colors.length]
      end

      def []=(index, value)
        @colors[index % @colors.length].color_index = value
      end
    end
  end
end

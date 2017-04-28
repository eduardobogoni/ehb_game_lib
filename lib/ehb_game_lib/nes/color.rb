module EhbGameLib
  module Nes
    class Color
      attr_accessor :color_index

      def initialize(all_colors, color_index)
        @all_colors = all_colors
        @color_index = color_index
      end

      def gosu_color
        @all_colors.gosu_color(color_index)
      end
    end
  end
end

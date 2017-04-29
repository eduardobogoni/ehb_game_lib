module EhbGameLib
  module Nes
    class Color
      attr_accessor :color_index

      BLACK = 0x0F
      YELLOW = 0x28
      RED = 0x05
      WHITE = 0x30

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

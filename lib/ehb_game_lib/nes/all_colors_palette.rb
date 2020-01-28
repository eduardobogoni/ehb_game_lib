# frozen_string_literal: true

module EhbGameLib
  module Nes
    class AllColorsPalette
      def initialize(pal_file)
        @colors = []
        File.open(pal_file) do |file|
          while (b = file.read(3))
            b = b.bytes.to_a
            @colors << Gosu::Color.rgba(b[0], b[1], b[2], 0xFF)
          end
        end
        @colors.freeze
      end

      def gosu_color(i)
        @colors[i]
      end

      def draw(x, y)
        s = 32
        @colors.each_with_index do |c, i|
          cx = x + (i % 16) * s
          cy = y + (i / 16) * s
          Gosu.draw_rect(cx, cy, s, s, c)
        end
      end
    end
  end
end

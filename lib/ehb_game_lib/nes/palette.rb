# frozen_string_literal: true

require 'ehb_game_lib/palettes/palette'

module EhbGameLib
  module Nes
    # Reference: http://www.firebrandx.com/nespalette.html
    class Palette < ::EhbGameLib::Palettes::Palette
      COLUMNS = %w[grey blue indigo purple violet red brown orange yellow lawn_green lime_green
                   sea_green cyan black].freeze
      ROWS = %w[dd d l ll].freeze

      COLUMNS.each_with_index do |c_name, c_index|
        ROWS.each_with_index do |r_name, r_index|
          const_set("#{c_name}_#{r_name}".upcase, r_index * 0x10 + c_index)
        end
      end

      BLACK = BLACK_DD
      WHITE = GREY_LL
      TRANSPARENT = 0x3F

      def initialize
        colors = ::EhbGameLib::Palettes::Color.array_from_file(
          ::File.join(__dir__, 'pvm_style_d93_palette.pal')
        )
        colors[TRANSPARENT] = ::EhbGameLib::Palettes::Color.new(0x00, 0x00, 0x00, 0x00)
        super(colors)
      end
    end
  end
end

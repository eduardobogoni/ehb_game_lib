# frozen_string_literal: true

require 'ehb_game_lib/media_path'
require 'rmagick'

module EhbGameLib
  module Palettes
    class Sprite
      class << self
        def from_file(file_path)
          new(::Magick::Image.read(file_path.to_s).first)
        end

        def to_gosu_image_options
          { retro: true, tileable: true }
        end
      end

      common_constructor :magick_image

      # @return Gosu::Image
      def gosu_image
        @gosu_image ||= begin
          the_path = '/tmp/temp_magick_image.png'
          magick_image.write(the_path)
          ::Gosu::Image.new(the_path, self.class.to_gosu_image_options)
        end
      end

      # @return [EhbGameLib::Palettes::Sprite]
      def palette_image(palette)
        r = magick_image.dup
        r.colors.times.each do |index|
          r.colormap(index, palette.color(index).magick_pixel)
        end
        self.class.new(r)
      end
    end
  end
end

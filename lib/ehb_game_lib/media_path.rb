# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'ehb_game_lib/palettes/sprite'
require 'ehb_game_lib/text/bitmap_font'

module EhbGameLib
  class MediaPath
    class << self
      # @return [EhbGameLib::MediaPath]
      def default
        @default ||= new
      end
    end

    # @return [Array]
    def paths
      @paths ||= []
    end

    # @return [Pathname]
    def find(subpath)
      paths.each do |path|
        full_path = path.to_pathname.expand_path.join(subpath)
        return full_path if full_path.exist?
      end
      raise "Subpath \"#{subpath}\" not found (Searched in: #{paths})"
    end

    # @return [EhbGameLib::Text::BitmapFont]
    def load_bitmap_font(subpath, line_height)
      ::EhbGameLib::Text::BitmapFont.new(find(subpath).to_path, line_height)
    end

    # @return [Gosu::Image]
    def load_gosu_image(subpath)
      ::Gosu::Image.new(find(subpath).to_path, ::EhbGameLib::Palettes::Sprite.to_gosu_image_options)
    end

    # @return [EhbGameLib::Palettes::Sprite]
    def load_sprite(subpath)
      ::EhbGameLib::Palettes::Sprite.from_file(find(subpath))
    end
  end
end

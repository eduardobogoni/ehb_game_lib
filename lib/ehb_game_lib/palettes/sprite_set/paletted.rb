# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EhbGameLib
  module Palettes
    module SpriteSet
      class Paletted
        common_constructor :palette, :source_set

        def [](name)
          sprite(name)
        end

        def sprite(name)
          sprites_hash[name.to_sym] ||= source_set.sprite(name).palette_image(palette)
        end

        def sprites
          source_set.sprites.keys.map { |name| [name, sprite(name)] }.to_h
        end

        private

        def sprites_hash
          @sprites_hash ||= {}
        end
      end
    end
  end
end

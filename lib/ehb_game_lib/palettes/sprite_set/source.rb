# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'ehb_game_lib/media_path'
require 'ehb_game_lib/palettes/sprite'

module EhbGameLib
  module Palettes
    module SpriteSet
      class Source
        enable_simple_cache
        common_constructor :media_path, default: [::EhbGameLib::MediaPath.default]

        def add(name, sprite)
          sprites_hash[name.to_sym] = sprite
          reset_cache :sprites
        end

        def load(subpath, name = nil)
          name ||= ::File.basename(subpath, '.*')

          add(name, media_path.load_sprite(subpath))
        end

        def [](name)
          sprite(name)
        end

        def sprite(name)
          sprites_hash.fetch(name.to_sym)
        end

        private

        def sprites_uncached
          sprites_hash.dup.freeze
        end

        def sprites_hash
          @sprites_hash ||= {}
        end
      end
    end
  end
end

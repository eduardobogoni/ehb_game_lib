# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'ehb_game_lib/math/rectable_object'

module EhbGameLib
  class Canvas
    include ::EhbGameLib::Math::RectableObject

    common_constructor :width, :height

    def x
      0
    end

    def y
      0
    end
  end
end

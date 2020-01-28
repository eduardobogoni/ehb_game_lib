# frozen_string_literal: true

module EhbGameLib
  class BaseState < ::Chingu::GameState
    def draw
      super
      ::EhbGameLib::Globals.window.draw_resized
    end
  end
end

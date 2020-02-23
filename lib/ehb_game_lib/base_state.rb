# frozen_string_literal: true

module EhbGameLib
  class BaseState < ::Chingu::GameState
    class << self
      attr_writer :resize_enabled

      def resize_enabled
        @resize_enabled = true if @resize_enabled.nil?
        @resize_enabled
      end

      def on_resize_enabled(enabled)
        old_value = resize_enabled
        begin
          self.resize_enabled = enabled
          yield
        ensure
          self.resize_enabled = old_value
        end
      end
    end

    def draw
      super
      ::EhbGameLib::Globals.window.draw_resized if resize_enabled?
    end

    def resize_enabled?
      ::EhbGameLib::BaseState.resize_enabled
    end
  end
end

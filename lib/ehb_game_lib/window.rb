# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'eac_ruby_utils/require_sub'
require 'ehb_game_lib/canvas'
::EacRubyUtils.require_sub(__FILE__)

module EhbGameLib
  class Window < ::Chingu::Window
    attr_accessor :fit_canvas_to_window, :draw_retro
    attr_reader :canvas, :canvas_factor

    def initialize(canvas_width, canvas_height)
      @canvas = ::EhbGameLib::Canvas.new(canvas_width, canvas_height)
      @canvas_factor = 1
      self.fit_canvas_to_window = true
      self.draw_retro = true
      super calculated_width, calculated_height
    end

    def calculated_width
      canvas.width * canvas_factor
    end

    def calculated_height
      canvas.height * canvas_factor
    end

    def canvas_factor=(factor)
      @canvas_factor = factor
      self.width = calculated_width
      self.height = calculated_height
    end

    def draw
      super if ::EhbGameLib::Globals.window
    end

    def draw_resized
      return unless fit_canvas_to_window

      ::Gosu::Image.new(canvas_image_source, retro: draw_retro)
                   .draw(0, 0, 100, canvas_factor, canvas_factor)
    end

    private

    def canvas_image_source
      image_source(0, height - canvas.height, canvas.width, canvas.height)
    end

    def image_source(x, y, w, h)
      GlReadPixelsImage.new(x, y, w, h)
    end
  end
end

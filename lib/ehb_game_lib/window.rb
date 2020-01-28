# frozen_string_literal: true

module EhbGameLib
  class Window < ::Chingu::Window
    attr_accessor :fit_canvas_to_window, :draw_retro
    attr_reader :canvas_width, :canvas_height, :canvas_factor

    def initialize(canvas_width, canvas_height)
      @canvas_width = canvas_width
      @canvas_height = canvas_height
      @canvas_factor = 1
      self.fit_canvas_to_window = true
      self.draw_retro = true
      super calculated_width, calculated_height
    end

    def calculated_width
      canvas_width * canvas_factor
    end

    def calculated_height
      canvas_height * canvas_factor
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
      image_source(0, height - canvas_height, canvas_width, canvas_height)
    end

    def image_source(x, y, w, h)
      GlReadPixelsImage.new(x, y, w, h)
    end

    class GlReadPixelsImage
      attr_reader :columns, :rows

      DEPTH = 4

      def initialize(x, y, width, height)
        @columns = width
        @rows = height
        Gosu.flush
        Gosu.gl do
          @blob = ::Gl.glReadPixels(x, y, width, height, Gl::GL_RGBA, Gl::GL_UNSIGNED_BYTE)
        end
      end

      def to_blob
        @blob.force_encoding('binary').scan(/.{#{columns * 4}}/m).reverse.join
      end
    end
  end
end

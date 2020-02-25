# frozen_string_literal: true

module EhbGameLib
  class Window < ::Chingu::Window
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

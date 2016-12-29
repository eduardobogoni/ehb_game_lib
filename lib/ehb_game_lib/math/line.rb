module EhbGameLib
  module Math
    class Line
      class << self
        def new_by_coordinates(x0, y0, x1, y1)
          new(
            y1 - y0,
            x0 - x1,
            y0 * x1 + x0 * y0 - x0 * y1 - y0 * x0
          )
        end
      end

      attr_reader :a, :b, :c

      def initialize(a, b, c)
        @a = a
        @b = b
        @c = c
      end

      def point_in?(vector)
        (vector.x * a + vector.y * b + c).zero?
      end
    end
  end
end

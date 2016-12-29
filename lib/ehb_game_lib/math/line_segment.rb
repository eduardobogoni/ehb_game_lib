module EhbGameLib
  module Math
    class LineSegment
      attr_reader :p0, :p1

      def initialize(x0, y0, x1, y1)
        @p0 = Vector.new(x0, y0)
        @p1 = Vector.new(x1, y1)
      end

      def line
        @line ||= Line.new_by_coordinates(p0.x, p0.y, p1.x, p1.y)
      end

      def point_in_area?(vector)
        x_interval.include?(vector.x) && y_interval.include?(vector.y)
      end

      private

      def x_interval
        @x_interval ||= interval(p0.x, p1.x)
      end

      def y_interval
        @y_interval ||= interval(p0.y, p1.y)
      end

      def interval(c0, c1)
        i = [c0, c1].sort
        (i[0]..i[1])
      end
    end
  end
end

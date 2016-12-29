module EhbGameLib
  module Math
    class Circle
      attr_reader :center, :radius

      def initialize(cx, cy, radius)
        @center = Vector.new(cx, cy)
        @radius = radius
      end

      def x
        center.x
      end

      def y
        center.y
      end
    end
  end
end

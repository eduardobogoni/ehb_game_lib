module EhbGameLib
  module Math
    class Circle
      attr_reader :center, :radius

      def initialize(cx, cy, radius)
        @center = Vector.new(cx, cy)
        @radius = radius
      end

      def to_s
        "C: #{center}, R: #{radius}"
      end

      def ys(x)
        QuadraticEquation.new(1, -2 * cy, ys_c(x)).roots
      end

      private

      def ys_c(x)
        x.abs2 - 2 * x * cx + cx.abs2 + cy.abs2 - r.abs2
      end

      def cx
        center.x
      end

      def cy
        center.y
      end

      def r
        radius
      end
    end
  end
end

module EhbGameLib
  module Math
    module Intersection
      class CircleLine
        def initialize(circle, line)
          @circle = circle
          @line = line
        end

        def intersection
          @intersection ||= intersection_uncached
        end

        def intersect?
          !intersection.empty?
        end

        private

        def intersection_uncached
          xs.flat_map do |x|
            @circle.ys(x).map { |y| Vector.new(x, y) }
          end
        end

        def xs
          QuadraticEquation.new(xs_a, xs_b, xs_c).roots
        end

        def xs_a
          b.abs2 + a.abs2
        end

        def xs_b
          -2 * cx * b.abs2 + 2 * a * (c + cy * b)
        end

        def xs_c
          xs_c0 + xs_c1
        end

        def xs_c0
          b.abs2 * (cx.abs2 + cy.abs2 - r.abs2)
        end

        def xs_c1
          c * (c + 2 * cy * b)
        end

        def a
          @line.a
        end

        def b
          @line.b
        end

        def c
          @line.c
        end

        def r
          @circle.radius
        end

        def cx
          @circle.center.x
        end

        def cy
          @circle.center.y
        end
      end
    end
  end
end

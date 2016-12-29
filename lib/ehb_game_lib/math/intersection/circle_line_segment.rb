module EhbGameLib
  module Math
    module Intersection
      class CircleLineSegment
        def initialize(circle, line_segment)
          @circle = circle
          @line_segment = line_segment
        end

        def intersection
          circle_line.intersection.select do |point|
            @line_segment.point_in_area?(point)
          end
        end

        private

        def circle_line
          @circle_line ||= CircleLine.new(@circle, @line_segment.line)
        end
      end
    end
  end
end

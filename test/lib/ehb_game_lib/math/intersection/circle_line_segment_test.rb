require 'test_helper'

module EhbGameLib
  module Math
    module Intersection
      class CircleLineSegmentTest < Test::Unit::TestCase
        test 'intersect' do
          @circle = Circle.new(0, 0, 1)
          assert_equal [], intersection(-1.1, -1, -1.1, 1)
          assert_equal [Vector.new(-1.0, 0)], intersection(-1.0, -1, -1.0, 1)
          assert_equal [Vector.new(0, -1)], intersection(0, -1, 0, 0)
          assert_equal [Vector.new(0, 1), Vector.new(0, -1)], intersection(0, -1, 0, 1)
          assert_equal [Vector.new(1, 0), Vector.new(-1, 0)], intersection(-2, 0, 2, 0)

          @circle = Circle.new(320, 120, 12)
          assert_equal [Vector.new(320, 132), Vector.new(320, 108)],
                       intersection(320.0, 215.0, 320.0, -4785.0)

          @circle = Circle.new(320, 240, 12)
          assert_equal [Vector.new(332, 240), Vector.new(308, 240)],
                       intersection(100, 240, 500, 240)
          assert_equal [Vector.new(332, 240), Vector.new(308, 240)],
                       intersection(455.0, 240, -4545.0, 240)
          assert_equal [Vector.new(332, 240), Vector.new(308, 240)],
                       intersection(455.0, 240.00000000012759, -4545.0, 239.9999999235764)
        end

        private

        def intersection(seg_x0, seg_y0, seg_x1, seg_y1)
          CircleLineSegment.new(
            @circle,
            ::EhbGameLib::Math::LineSegment.new(seg_x0, seg_y0, seg_x1, seg_y1)
          ).intersection
        end
      end
    end
  end
end

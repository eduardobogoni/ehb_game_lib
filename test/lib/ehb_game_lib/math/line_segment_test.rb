# frozen_string_literal: true

require 'test_helper'

module EhbGameLib
  module Math
    class LineSegmentTest < Test::Unit::TestCase
      test 'point_in_area?' do
        line = LineSegment.new(-1, -1, -1, 1)
        assert_equal true, line.point_in_area?(Vector.new(-1, -1))
        assert_equal true, line.point_in_area?(Vector.new(-1, 1))
        assert_equal true, line.point_in_area?(Vector.new(-1, 0))
        assert_equal false, line.point_in_area?(Vector.new(-1, 2))
        assert_equal false, line.point_in_area?(Vector.new(-1.1, 2))

        line = LineSegment.new(-1, -1, 1, -1)
        assert_equal true, line.point_in_area?(Vector.new(-1, -1))
        assert_equal true, line.point_in_area?(Vector.new(1, -1))
        assert_equal true, line.point_in_area?(Vector.new(0, -1))
        assert_equal false, line.point_in_area?(Vector.new(2, -1))
        assert_equal false, line.point_in_area?(Vector.new(2, -1.1))

        line = LineSegment.new(455.0, 240.00000000012759, -4545.0, 239.9999999235764)
        assert_equal true, line.point_in_area?(Vector.new(332.0, 240.0))
        assert_equal true, line.point_in_area?(Vector.new(308.0, 240.0))
      end
    end
  end
end

require 'test_helper'

module EhbGameLib
  module Math
    class LineTest < Test::Unit::TestCase
      test 'new_by_coordinates' do
        l = Line.new_by_coordinates(100, 240, 500, 240)
        assert_equal(0, l.a)
        assert_equal(-400, l.b)
        assert_equal(96_000, l.c)

        l = Line.new_by_coordinates(455.0, 240, -4545.0, 240)
        assert_equal(0, l.a)
        assert_equal(5000, l.b)
        assert_equal(-1_200_000, l.c)

        l = Line.new_by_coordinates(455.0, 240.00000000012759, -4545.0, 239.9999999235764)
        assert_equal(-7.65511742883973e-08, l.a)
        assert_equal(5000, l.b)
        assert_equal(-1_199_999.9999658072, l.c)
      end

      test 'point_in?' do
        line = Line.new_by_coordinates(-1, -1, -1, 1)
        assert_equal true, line.point_in?(Vector.new(-1, -1))
        assert_equal true, line.point_in?(Vector.new(-1, 1))
        assert_equal true, line.point_in?(Vector.new(-1, 0))
        assert_equal true, line.point_in?(Vector.new(-1, 2))
        assert_equal false, line.point_in?(Vector.new(-1.1, 2))

        line = Line.new_by_coordinates(-1, -1, 1, -1)
        assert_equal true, line.point_in?(Vector.new(-1, -1))
        assert_equal true, line.point_in?(Vector.new(1, -1))
        assert_equal true, line.point_in?(Vector.new(0, -1))
        assert_equal true, line.point_in?(Vector.new(2, -1))
        assert_equal false, line.point_in?(Vector.new(2, -1.1))
      end
    end
  end
end

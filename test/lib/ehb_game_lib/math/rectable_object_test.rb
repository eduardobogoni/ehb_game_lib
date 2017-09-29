require 'test_helper'

module EhbGameLib
  module Math
    class RectableObjectTest < Test::Unit::TestCase
      class Stub
        include ::EhbGameLib::Math::RectableObject

        attr_accessor :x, :y

        def width
          10
        end

        def height
          10
        end
      end

      setup do
        @o = Stub.new
      end

      test 'x anchor' do
        @o.x = 20
        assert_x_values(20, 20, 25, 30)

        @o.ax.anchor = :mean
        assert_x_values(20, 15, 20, 25)

        @o.ax.anchor = :ceil
        assert_x_values(20, 10, 15, 20)
      end

      test 'y anchor' do
        @o.y = 20
        assert_y_values(20, 20, 25, 30)

        @o.ay.anchor = :mean
        assert_y_values(20, 15, 20, 25)

        @o.ay.anchor = :ceil
        assert_y_values(20, 10, 15, 20)
      end

      test 'left set' do
        @o.ax.anchor = :floor
        @o.left = 20
        assert_x_values(20, 20, 25, 30)

        @o.ax.anchor = :mean
        @o.left = 30
        assert_x_values(35, 30, 35, 40)

        @o.ax.anchor = :ceil
        @o.left = 40
        assert_x_values(50, 40, 45, 50)
      end

      private

      def assert_x_values(x, left, center, right)
        assert_equal x, @o.x, 'x'
        assert_equal left, @o.left, 'left'
        assert_equal center, @o.center, 'center'
        assert_equal right, @o.right, 'right'
      end

      def assert_y_values(y, top, middle, bottom)
        assert_equal y, @o.y, 'y'
        assert_equal top, @o.top, 'top'
        assert_equal middle, @o.middle, 'middle'
        assert_equal bottom, @o.bottom, 'bottom'
      end
    end
  end
end

# frozen_string_literal: true

require 'test_helper'

module EhbGameLib
  module Math
    class CircleTest < Test::Unit::TestCase
      test 'ys' do
        circle = Circle.new(0, 0, 1)
        assert_equal [], circle.ys(-1.1)
        assert_equal [0], circle.ys(-1)
        assert_equal [1, -1], circle.ys(0)
        assert_equal [0], circle.ys(1)
        assert_equal [], circle.ys(1.1)
      end
    end
  end
end

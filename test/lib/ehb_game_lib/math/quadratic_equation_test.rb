# frozen_string_literal: true

require 'test_helper'

module EhbGameLib
  module Math
    class QuadraticEquationTest < Test::Unit::TestCase
      test 'delta' do
        assert_equal(-8, QuadraticEquation.new(1, 2, 3).delta)
        assert_equal(0, QuadraticEquation.new(1, 8, 16).delta)
        assert_equal(16, QuadraticEquation.new(1, 2, -3).delta)
      end

      test 'roots' do
        assert_equal([], QuadraticEquation.new(1, 2, 3).roots)
        assert_equal([-4], QuadraticEquation.new(1, 8, 16).roots)
        assert_equal([1, -3], QuadraticEquation.new(1, 2, -3).roots)
      end
    end
  end
end

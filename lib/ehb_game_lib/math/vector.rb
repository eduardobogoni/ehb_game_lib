# frozen_string_literal: true

module EhbGameLib
  module Math
    class Vector
      attr_reader :x, :y

      def initialize(x, y)
        @x = x
        @y = y
      end

      def to_s
        "#{x}, #{y}"
      end

      def equal?(other)
        x == other.x && y == other.y
      end

      def ==(other)
        equal?(other)
      end

      def +(other)
        self.class.new(x + other.x, y + other.y)
      end

      def -(other)
        self.class.new(x - other.x, y - other.y)
      end

      def *(other)
        self.class.new(x * other, y * other)
      end

      def /(other)
        self.class.new(x / other, y / other)
      end

      def dot(other)
        x * other.x + y * other.y
      end

      def length
        @length ||= ::Math.sqrt(x * x + y * y)
      end

      def normalize
        self / length
      end
    end
  end
end

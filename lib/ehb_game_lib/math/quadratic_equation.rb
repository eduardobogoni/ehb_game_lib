module EhbGameLib
  module Math
    class QuadraticEquation
      attr_reader :a, :b, :c

      def initialize(a, b, c)
        @a = a
        @b = b
        @c = c
      end

      def roots
        return [root(1), root(-1)] if delta > 0.0
        return [root(1)] if delta == 0.0
        []
      end

      def delta
        @delta ||= b**2 - 4 * a * c
      end

      def root(signal)
        signal = signal < 0 ? -1 : 1
        (-b + signal * ::Math.sqrt(delta)) / (2 * a)
      end
    end
  end
end

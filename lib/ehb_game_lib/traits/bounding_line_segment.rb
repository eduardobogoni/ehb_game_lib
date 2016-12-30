module EhbGameLib
  module Traits
    # Interface required:
    # attr_reader :last_x, :last_y
    module BoundingLineSegment
      def nearest_circle_collision(klasses)
        return [nil, nil] unless line_segment?
        min_obj = min_p = min_dist = nil
        each_circle_collision(klasses) do |object, p|
          dist = Gosu.distance(last_x, last_y, p.x, p.y)
          next unless min_dist.nil? || dist < min_dist
          min_dist = dist
          min_obj = object
          min_p = p
        end
        [min_obj, min_p]
      end

      private

      def each_circle_collision(klasses)
        each_game_object(klasses) do |object|
          object_intersection(object).intersection.each do |p|
            yield(object, p)
          end
        end
      end

      def each_game_object(klasses)
        Array(klasses).each do |klass|
          (klass.respond_to?(:all) ? klass.all : Array(klass)).each do |object|
            yield(object)
          end
        end
      end

      def line_segment?
        last_x.nil? || last_y.nil? || x.nil? || y.nil? ? false : true
      end

      def line_segment
        ::EhbGameLib::Math::LineSegment.new(last_x, last_y, x, y)
      end

      def object_circle(object)
        ::EhbGameLib::Math::Circle.new(object.x, object.y, object.radius)
      end

      def object_intersection(object)
        ::EhbGameLib::Math::Intersection::CircleLineSegment.new(
          object_circle(object), line_segment
        )
      end
    end
  end
end

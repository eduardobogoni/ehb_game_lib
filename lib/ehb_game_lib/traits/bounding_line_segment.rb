module TopView
  module Traits
    module Moveable
      attr_accessor :speed

      def setup_trait(_options)
        super
        @speed = 0
      end

      def update_trait
        super
        self.x = (x + Gosu.offset_x(angle, speed))
        self.y = (y + Gosu.offset_y(angle, speed))
      end

      def draw_trait
        super
      end

      def speed
        @speed
      end
    end
  end
end

module EhbGameLib
  module Math
    module RectableObject
      H_AXIS = { name: :ax, coord: :x, size: :width, floor: :left, mean: :center,
                 ceil: :right }.freeze
      V_AXIS = { name: :ay, coord: :y, size: :height, floor: :top, mean: :middle,
                 ceil: :bottom }.freeze

      [H_AXIS, V_AXIS].each do |a|
        class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
          def #{a[:name]}
            @#{a[:name]} ||= Axis.new(
              -> { #{a[:coord]} },
              -> (v) { self.#{a[:coord]} = v },
              -> { #{a[:size]} }
            )
          end
        RUBY_EVAL

        [:floor, :mean, :ceil].each do |m|
          class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
            def #{a[m]}
              #{a[:name]}.#{m}
            end

            def #{a[m]}=(v)
              #{a[:name]}.#{m} = v
            end
          RUBY_EVAL
        end
      end

      def rect
        ::Chingu::Rect.new(left, top, width, height)
      end

      class Axis
        def initialize(coord_get, coord_set, size_get)
          @coord_get = coord_get
          @coord_set = coord_set
          @size_get = size_get
        end

        def coord
          @coord_get.call
        end

        def coord=(v)
          @coord_set.call(v)
        end

        def size
          @size_get.call
        end

        def floor
          coord
        end

        def floor=(v)
          self.coord = v
        end

        def mean
          coord + size / 2
        end

        def mean=(v)
          self.coord = v - size / 2
        end

        def ceil
          coord + size
        end

        def ceil=(v)
          self.coord = v - size
        end
      end
    end
  end
end

# frozen_string_literal: true

module EhbGameLib
  module Math
    module RectableObject
      class Axis
        attr_accessor :anchor

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

        %w[floor mean ceil].each do |m|
          class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
            def #{m}
              coord + #{m}_delta
            end

            def #{m}=(v)
              self.coord = v - #{m}_delta
            end
          RUBY_EVAL
        end

        private

        def floor_delta
          case anchor
          when :mean then - size / 2
          when :ceil then - size
          else 0
          end
        end

        def mean_delta
          case anchor
          when :mean then 0
          when :ceil then - size / 2
          else size / 2
          end
        end

        def ceil_delta
          case anchor
          when :mean then size / 2
          when :ceil then 0
          else size
          end
        end
      end
    end
  end
end

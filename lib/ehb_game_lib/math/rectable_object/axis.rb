# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EhbGameLib
  module Math
    module RectableObject
      class Axis
        attr_accessor :anchor

        common_constructor :coord_get, :coord_set, :size_get

        def coord
          coord_get.call
        end

        def coord=(v)
          coord_set.call(v)
        end

        def size
          size_get.call
        end

        %w[floor mean ceil].each do |m|
          define_method m do
            coord + send("#{m}_delta")
          end

          define_method "#{m}=" do |v|
            self.coord = v - send("#{m}_delta")
          end
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

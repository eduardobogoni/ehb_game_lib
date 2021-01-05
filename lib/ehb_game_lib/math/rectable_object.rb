# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EhbGameLib
  module Math
    module RectableObject
      require_sub __FILE__

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

        %i[floor mean ceil].each do |m|
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
    end
  end
end

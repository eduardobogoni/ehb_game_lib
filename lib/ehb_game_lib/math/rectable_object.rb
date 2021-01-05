# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EhbGameLib
  module Math
    module RectableObject
      require_sub __FILE__

      [%i[ax x width left center right],
       %i[ay y height top middle bottom]].each do |aa|
        a = ::OpenStruct.new(
          %i[name coord size floor mean ceil]
          .each_with_index.map { |k, i| [k, aa[i]] }.to_h
        )

        define_method a.name do
          @data ||= {}
          @data[a.name] ||=
            Axis.new(
              -> { send(a.coord) },
              ->(v) { send("#{a.coord}=", v) },
              -> { send(a.size) }
            )
        end

        %i[floor mean ceil].each do |m|
          define_method a[m] do
            send(a.name).send(m)
          end

          define_method "#{a[m]}=" do |v|
            send(a.name).send("#{m}=", v)
          end
        end
      end

      def rect
        ::Chingu::Rect.new(left, top, width, height)
      end
    end
  end
end

# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EhbGameLib
  module Math
    module RectableObject
      require_sub __FILE__

      [%i[ax x width x_anchor left center right], # rubocop:disable Metrics/BlockLength
       %i[ay y height y_anchor top middle bottom]].each do |aa|
        a = ::OpenStruct.new(
          %i[name coord size anchor floor mean ceil]
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

        %i[anchor floor mean ceil].each do |m|
          define_method a[m] do |*args|
            if args.count.zero?
              send(a.name).send(m)
            elsif args.count == 1
              send(a.name).send("#{m}=", args[0])

              self
            else
              raise ::ArgumentError, "Invalid number of arguments (#{args.count} for 0..1)"
            end
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

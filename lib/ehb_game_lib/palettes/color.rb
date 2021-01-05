# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'gosu'
require 'rmagick'

module EhbGameLib
  module Palettes
    class Color
      QUANTUM_MIN = 0
      QUANTUM_MAX = 255
      QUANTUM_RANGE = (QUANTUM_MIN..QUANTUM_MAX).freeze

      class << self
        def validate_quantum(quantum)
          raise "Not a integer: #{quantum}" unless quantum.is_a?(::Integer)
          raise 'Out of bounds' unless QUANTUM_RANGE.include?(quantum)

          quantum
        end

        def quantum_to_magick_range(quantum, invert = false)
          r = ((quantum / QUANTUM_MAX.to_f) * ::Magick::QuantumRange).floor
          r = ::Magick::QuantumRange - r if invert
          r
        end

        # @return [Array<EhbGameLib::Palettes::Color>]
        def array_from_file(file_path)
          r = []
          ::File.open(file_path.to_s) do |file|
            while (b = file.read(3))
              b = b.bytes.to_a
              r << ::EhbGameLib::Palettes::Color.new(b[0], b[1], b[2])
            end
          end
          r
        end
      end

      enable_simple_cache
      attr_reader :red, :green, :blue, :alpha

      def initialize(red, green, blue, alpha = QUANTUM_MAX)
        @red = self.class.validate_quantum(red)
        @green = self.class.validate_quantum(green)
        @blue = self.class.validate_quantum(blue)
        @alpha = self.class.validate_quantum(alpha)
      end

      # @return [Gosu::Color]
      def gosu_color
        @gosu_color ||= ::Gosu::Color.rgba(red, green, blue, alpha)
      end

      # @return [Magick::Pixel]
      def magick_pixel
        @magick_pixel ||= ::Magick::Pixel.new(
          *[red, green, blue].map { |n| self.class.quantum_to_magick_range(n) },
          self.class.quantum_to_magick_range(alpha, true)
        )
      end

      def names
        Array(::Colorname.find(red, green, blue))
      end

      def rgb_to_s
        values_to_s(red, green, blue)
      end

      def rgba_to_s
        rgb_to_s + '|' + values_to_s(alpha)
      end

      def to_a
        [red, green, blue, alpha]
      end

      def to_s
        rgba_to_s
      end

      def to_html
        '#' + rgb_to_s
      end

      private

      def values_to_s(*values)
        values.map { |i| i.to_s(16).rjust(2, '0') }.join.upcase
      end
    end
  end
end

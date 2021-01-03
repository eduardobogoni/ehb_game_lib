# frozen_string_literal: true

require 'gosu'
require 'ehb_game_lib/palettes/color'

module EhbGameLib
  module Palettes
    class Palette
      class << self
        # @return [EhbGameLib::Palettes::Palette]
        def from_file(file_path)
          new(::EhbGameLib::Palettes::Color.array_from_file(file_path))
        end
      end

      # @return [Array<Gosu::Color>]
      attr_reader :colors

      def initialize(colors)
        colors.each_with_index do |color, index|
          unless color.is_a?(::EhbGameLib::Palettes::Color)
            raise "\##{index} is not a Palette::Color (#{color})"
          end
        end
        @colors = colors.to_a.freeze
      end

      # @return [EhbGameLib::Palettes::Color]
      def color(index)
        colors.fetch(index)
      end

      # @return [EhbGameLib::Palettes::Color]
      def [](index)
        colors.fetch(index)
      end

      # @return [EhbGameLib::Palettes::Palette]
      def sub(*indexes)
        sub_class.new(indexes.map { |index| color(index) })
      end

      def sub_class
        ::EhbGameLib::Palettes::Palette
      end
    end
  end
end

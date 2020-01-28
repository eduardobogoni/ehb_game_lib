# frozen_string_literal: true

module EhbGameLib
  module Utils
    class Cursor
      def initialize(set)
        @set = set.to_a
        @index = nil
      end

      delegate :count, :each, :inject, :map, to: :set

      def select_last
        self.index = @set.length - 1
      end

      def next_element
        next_previous_element(1)
      end

      def previous_element
        next_previous_element(-1)
      end

      def current
        index.nil? ? nil : @set[index]
      end

      def index
        fix_index
        @index
      end

      private

      def fix_index
        if @set.empty?
          @index = nil
        elsif @index.nil?
          @index = 0
        elsif @index >= @set.count
          @index = @set.count - 1
        elsif @index.negative?
          @index = 0
        end
      end

      def index=(value)
        @index = value
        fix_index
      end

      attr_reader :set

      def next_previous_element(steps)
        self.index = (index + steps) % @set.count
      end
    end
  end
end

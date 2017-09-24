module EhbGameLib
  module RectableObject
    [{ axis: :x, size: :width, floor: :left, mean: :center, ceil: :right },
     { axis: :y, size: :height, floor: :top, mean: :middle, ceil: :bottom }].each do |c|
      class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
        def #{c[:floor]}
          #{c[:axis]}
        end

        def #{c[:floor]}=(v)
          self.#{c[:axis]} = v
        end

        def #{c[:mean]}
          #{c[:axis]} + #{c[:size]} / 2
        end

        def #{c[:mean]}=(v)
          self.#{c[:axis]} = v - #{c[:size]} / 2
        end

        def #{c[:ceil]}
          #{c[:axis]} + #{c[:size]}
        end

        def #{c[:ceil]}=(v)
          self.#{c[:axis]} = v - #{c[:size]}
        end

        def rect
          ::Chingu::Rect.new(left, top, width, height)
        end
      RUBY_EVAL
    end
  end
end

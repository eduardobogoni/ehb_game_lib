module EhbGameLib
  module Patches
    module Gosu
      module Font
        # Draw text with line breaks.
        def drawm(text, x, y, z, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default)
          text.each_line do |line|
            draw(line.delete("\n"), x, y, z, scale_x, scale_y, color, mode)
            y += height
          end
        end

        def text_height(text)
          text.lines.count * height
        end

        def text_width(text)
          text.lines.map { |l| super(l) }.max
        end
      end
    end
  end
end

unless ::Gosu::Font.included_modules.include?(
  ::EhbGameLib::Patches::Gosu::Font
)
  ::Gosu::Font.prepend(::EhbGameLib::Patches::Gosu::Font)
end

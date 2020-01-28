# frozen_string_literal: true

module EhbGameLib
  class Gfx
    class << self
      def fill_circle(cx, cy, r, color, z)
        x1 = 0
        y1 = -r
        circ = 2 * ::Math::PI * r
        step = 360 / circ
        step.step(45, step) do |a|
          x2 = Gosu.offset_x(a, r)
          y2 = Gosu.offset_y(a, r)
          EhbGameLib::Globals.window.draw_quad \
            cx + x1, cy + y1, color, cx + x2, cy + y2, color,
            cx - x2, cy + y2, color, cx - x1, cy + y1, color, z
          EhbGameLib::Globals.window.draw_quad \
            cx - x1, cy - y1, color, cx - x2, cy - y2, color,
            cx + x2, cy - y2, color, cx + x1, cy - y1, color, z
          EhbGameLib::Globals.window.draw_quad \
            cx + y1, cy + x1, color, cx + y2, cy + x2, color,
            cx - y2, cy + x2, color, cx - y1, cy + x1, color, z
          EhbGameLib::Globals.window.draw_quad \
            cx - y1, cy - x1, color, cx - y2, cy - x2, color,
            cx + y2, cy - x2, color, cx + y1, cy - x1, color, z
          x1 = x2
          y1 = y2
        end
        EhbGameLib::Globals.window.draw_quad \
          cx + x1, cy + y1, color, cx - y1, cy - x1, color,
          cx + y1, cy - x1, color, cx - x1, cy + y1, color, z
        EhbGameLib::Globals.window.draw_quad \
          cx - x1, cy - y1, color, cx + y1, cy + x1, color,
          cx - y1, cy + x1, color, cx + x1, cy - y1, color, z
      end
    end
  end
end

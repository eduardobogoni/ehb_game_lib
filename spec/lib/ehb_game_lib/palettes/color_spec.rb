# frozen_string_literal: true

require 'ehb_game_lib/palettes/color'

::RSpec.describe ::EhbGameLib::Palettes::Color do
  describe '#magick_color' do
    [[0, 1, 1, 0], [1, 0, 0, 1]].each do |source|
      rgba_source = source.map do |n|
        if n.zero?
          ::EhbGameLib::Palettes::Color::QUANTUM_MIN
        else
          ::EhbGameLib::Palettes::Color::QUANTUM_MAX
        end
      end
      rgba_target = source.map do |n|
        if n.zero?
          0
        else
          ::Magick::QuantumRange
        end
      end

      context "when RGBA is #{rgba_source}" do
        let(:instance) { described_class.new(*rgba_source) }

        it { expect(instance.magick_pixel.red).to eq(rgba_target[0]) }
        it { expect(instance.magick_pixel.green).to eq(rgba_target[1]) }
        it { expect(instance.magick_pixel.blue).to eq(rgba_target[2]) }
        it { expect(instance.magick_pixel.alpha).to eq(rgba_target[3]) }
      end
    end
  end
end

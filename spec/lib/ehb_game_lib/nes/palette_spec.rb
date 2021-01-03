# frozen_string_literal: true

require 'ehb_game_lib/nes/palette'

RSpec.describe ::EhbGameLib::Nes::Palette do
  let(:instance) { described_class.new }

  {
    black: [0x00, 0x00, 0x00, 0xFF],
    white: [0xFF, 0xFF, 0xFF, 0xFF],
    transparent: [0x00, 0x00, 0x00, 0x00]
  }.each do |color_name, expected_value|
    context "when color is #{color_name}" do
      let(:color_index) { described_class.const_get(color_name.upcase) }
      it { expect(instance.color(color_index).to_a).to eq(expected_value) }
    end
  end
end

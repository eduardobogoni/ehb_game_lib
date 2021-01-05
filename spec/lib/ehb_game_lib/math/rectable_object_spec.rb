# frozen_string_literal: true

require 'ehb_game_lib/math/rectable_object'
require 'ostruct'
require 'eac_ruby_utils/core_ext'

RSpec.describe ::EhbGameLib::Math::RectableObject do
  let(:instance) { ::OpenStruct.new(x: 1, y: 2, width: 4, height: 8) }

  before { instance.singleton_class.include(described_class) }

  { floor: [1, 3, 5], mean: [-1, 1, 3], ceil: [-3, -1, 1] }.each do |anchor, expected|
    context "when anchor x is #{anchor}" do
      before { instance.ax.anchor = anchor }
      it { expect(instance.left).to eq(expected[0]) }
      it { expect(instance.center).to eq(expected[1]) }
      it { expect(instance.right).to eq(expected[2]) }
    end
  end

  { floor: [2, 6, 10], mean: [-2, 2, 6], ceil: [-6, -2, 2] }.each do |anchor, expected|
    context "when anchor y is #{anchor}" do
      before { instance.ay.anchor = anchor }

      it { expect(instance.top).to eq(expected[0]) }
      it { expect(instance.middle).to eq(expected[1]) }
      it { expect(instance.bottom).to eq(expected[2]) }
    end
  end
end

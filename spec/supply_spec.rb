require 'supply'
require_relative '../lib/supply'

describe Supply do
  let(:items) {
    [ Item.new("in-date", 15, 10),
      Item.new("out-of-date", 0, 5),
      Item.new("quality negative", 1, -5),
      Item.new("quality over 50", 1, 52),
      Item.new("Aged Brie", 15, 10),
      Item.new("Sulfuras", 25, 80),
      Item.new("Backstage passes", 15, 10)
    ]
  }
  subject(:supply) { described_class.new(items) }

  context 'Normal items' do
    describe '#update_quality' do
      it 'does not change the name' do
        items = [Item.new("Aged Brie", 0, 10)]
        supply.update_quality
        expect(items[0].name).to eq "Aged Brie"
      end
    end

    describe 'quality value' do
      it 'is never more than 50' do
        items = [Item.new("Cheddar", 10, 50)]
        expect{ supply.update_quality }.to raise_error 'Quality cannot be more than 50'
        # expect{ supply.update_quality }.to_not change{ item.quality }.by 1
      end
      it 'is never negative' do
        items = [Item.new("out-of-date", 0, 5)]
        expect{ supply.update_quality }.to raise_error 'Quality cannot be negative'
      end
    end
  #   end
  #   describe 'sell by date' do
  #     it 'degrades twice as fast once quality is 0' do
  #       expect{ supply.update_quality }.to change{ supply.items[1].quality }.by(-2)
  #     end
  #   end
  # end
  #
  # context 'Given the end of the day' do
  #   describe '#update_quality' do
  #     it 'updates quality by -1' do
  #       expect{ supply.update_quality }.to change{ supply.items[0].quality }.by(-1)
  #     end
  #     it 'updates sell_in by -1' do
  #       expect{ supply.update_quality }.to change{ supply.items[0].quality }.by(-1)
  #     end
  #   end
  # end
  #
  # context 'Special items' do
  #   describe 'Legendary' do
  #     it 'Sulfuras has a default quality of 80' do
  #       expect{ supply.update_quality }.not_to change{ supply.items[5].quality }.by(1)
  #     end
  #   end
  #   describe 'Aged Brie' do
  #     it 'increases in quality as sell_in value approaches' do
  #       expect{ supply.update_quality }.to change{ supply.items[4].quality }.by(1)
  #     end
  #   end
  #   describe 'Backstage passes' do
  #     it 'increases in quality as sell_in value approaches' do
  #       expect{ supple.update_quality }.to change{ supply.items[6].quality }.by(1)
  #     end
  #   end
  # end
  #
  # context 'Less than 10, but more than 5 days' do
  #   describe 'Backstage passes' do
  #     it 'increases in quality by 2' do
  #       supply.update_quality
  #       expect{ supply.update_quality }.to change{ supply.items[6].quality }.by(2)
  #     end
    end
  end

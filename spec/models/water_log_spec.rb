require 'spec_helper'

describe WaterLog do

  let(:water_log) { WaterLog.new }

  describe '#volume_in_ounces' do
    it 'should be a BigDecimal' do
      expect(water_log.volume_in_ounces).to be_kind_of(BigDecimal)
    end

    it 'should convert from #volume mililiters' do
      water_log.volume = '500'
      expect(water_log.volume_in_ounces).to be_within(0.1).of(BigDecimal.new('16.9'))
    end
  end

  describe '#volume_in_ounces=' do
    it 'should set the volume in mililiters' do
      water_log.volume_in_ounces = '16.9'
      expect(water_log.volume).to be_within(1).of(BigDecimal.new('500'))
    end
  end
end

require 'spec_helper'

describe WeightLog do

  let(:weight_log) { WeightLog.new }

  describe '#weight_in_lbs' do
    it 'should be a BigDecimal' do
      expect(weight_log.weight_in_lbs).to be_kind_of(BigDecimal)
    end

    it 'should convert from #weight kilos' do
      weight_log.weight = '5'
      expect(weight_log.weight_in_lbs).to be_within(0.1).of(BigDecimal.new('11'))
    end
  end

  describe '#weight_in_lbs=' do
    it 'should set the weight in kilos' do
      weight_log.weight_in_lbs = '50'
      expect(weight_log.weight).to be_within(0.1).of(BigDecimal.new('22.7'))
    end
  end
end

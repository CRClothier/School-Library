require './decorator'

describe Decorator do
  context 'given a namable with correct_name julius' do
    let(:namable) { double('Namable').as_null_object }

    it 'should return the string correct_name "julius"' do
      allow(namable).to receive(:correct_name).and_return('julius')
      decorated_namable = Decorator.new(namable)

      result = decorated_namable.correct_name

      expect(result).to eq('julius')
    end
  end
end

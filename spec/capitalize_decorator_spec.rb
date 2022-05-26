require './capitalize_decorator'

describe CapitalizeDecorator do
  context 'given a namable with correct_name julius' do
    let(:namable) { double('Namable').as_null_object }

    it 'should return the string correct_name capitalized "Julius"' do
      allow(namable).to receive(:correct_name).and_return('julius')
      capitalized_namable = CapitalizeDecorator.new(namable)

      result = capitalized_namable.correct_name

      expect(result).to eq('Julius')
    end
  end
end

require './trimmer_decorator'

describe TrimmerDecorator do
  context 'given a namable with correct_name julius' do
    let(:namable) { double('Namable').as_null_object }

    it 'should return the string correct_name trimmed to "Bartholome"' do
      allow(namable).to receive(:correct_name).and_return('Bartholomew')
      trimmed_namable = TrimmerDecorator.new(namable)

      result = trimmed_namable.correct_name

      expect(result).to eq('Bartholome')
    end
  end
end

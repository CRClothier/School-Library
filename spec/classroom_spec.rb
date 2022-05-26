require './classroom'

describe Classroom do
  context 'given label' do
    it 'should create a new classroom' do
      label = 'A-1'

      result = Classroom.new(label)

      expect(result).to be_truthy
    end
  end

  context 'given a classroom' do
    it 'label attribute should be readable and writable' do
      classroom = Classroom.new('A-1')

      classroom.label = 'B-2'

      expect(classroom.label).to eq('B-2')
    end
  end

  context 'method add_student given a student' do
    let(:student) { double('Student').as_null_object }

    it 'should asign self to the classroom attribute of student' do
      classroom = Classroom.new('A-1')

      expect(student).to receive(:classroom=).with(classroom).at_least(:once)
      classroom.add_student(student)
    end
  end
end

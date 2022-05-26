require './student'

describe Student do
  context 'given an age' do
    it 'should create a Student' do
      age = 33

      result = Student.new(age, nil)

      expect(result).to be_truthy
    end
  end

  context 'given a student' do
    it 'should allow reading an writing the attribute name' do
      student = Student.new(21, nil)

      student.name = 'other'

      expect(student.name).to eq('other')
    end

    it 'should allow reading an writing the attribute age' do
      student = Student.new(41, nil)

      student.age = 23

      expect(student.age).to eq(23)
    end

    it 'should allow reading the attribute id' do
      student = Student.new(44, nil, id: 136)

      expect(student.id).to eq(136)
    end

    it 'should allow reading the attribute classroom' do
      student = Student.new(44, nil, id: 136)

      expect(student.classroom).to eq(nil)
    end
  end

  context 'method play_hooky' do
    it 'should return an emoji string' do
      student = Student.new(12, nil)
      result = student.play_hooky

      expect(result).to eq('¯\(ツ)/¯')
    end
  end
end

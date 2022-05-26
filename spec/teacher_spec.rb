require './teacher'

describe Teacher do
  context 'given an age' do
    it 'should create a Teacher' do
      age = 33

      result = Teacher.new(age, 'Maths')

      expect(result).to be_truthy
    end
  end

  context 'given a teacher' do
    it 'should allow reading an writing the attribute name' do
      teacher = Teacher.new(21, 'Maths')

      teacher.name = 'other'

      expect(teacher.name).to eq('other')
    end

    it 'should allow reading an writing the attribute age' do
      teacher = Teacher.new(41, 'Maths')

      teacher.age = 23

      expect(teacher.age).to eq(23)
    end

    it 'should allow reading the attribute id' do
      teacher = Teacher.new(44, 'Maths', id: 136)

      expect(teacher.id).to eq(136)
    end
  end

  context 'method can_use_services?' do
    it 'should return true' do
      teacher = Teacher.new(12, 'Maths')
      result = teacher.can_use_services?

      expect(result).to eq(true)
    end
  end
end
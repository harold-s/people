RSpec.describe Person, type: :model do
  subject(:person) { Person.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.not_to validate_presence_of(:middle_name) }
  end

  describe '#full_name' do
    let(:first_name) { Faker::Name.first_name }
    let(:middle_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }

    context 'when middle name is absent' do
      let(:full_name) { "#{first_name} #{last_name}" }

      it 'can construct a full name from first and last names' do
        person.first_name = first_name
        person.last_name = last_name
        expect(person.full_name).to eq full_name
      end
    end

    context 'when middle name is present' do
      let(:full_name) { "#{first_name} #{middle_name} #{last_name}" }

      it 'can construct a full name from first and last names' do
        person.first_name = first_name
        person.middle_name = middle_name
        person.last_name = last_name
        expect(person.full_name).to eq full_name
      end
    end
  end
end

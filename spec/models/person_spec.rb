# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'must have a first name' do
    person = Person.new
    person.first_name = nil
    person.valid?
    expect(person.errors[:first_name]).to include("can't be blank")
  end

  it 'can construct a full name from the first and last names' do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    person = Person.new(first_name: first_name, last_name: last_name)
    expect(person.full_name).to eq("#{first_name} #{last_name}")
  end
end

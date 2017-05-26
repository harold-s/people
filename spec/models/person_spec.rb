# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'must have a first name' do
    person = Person.new
    person.first_name = nil
    person.valid?
    expect(person.errors[:first_name]).to include("can't be blank")
  end
end

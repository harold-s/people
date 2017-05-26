# frozen_string_literal: true

class Person < ApplicationRecord
  validates :first_name, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end
end

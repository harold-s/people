# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name, limit: 50
      t.string :middle_name, limit: 50
      t.string :last_name, limit: 50
      t.string :email, limit: 150
    end
    add_index :people, :first_name
    add_index :people, :last_name
    add_index :people, :email, unique: true
  end
end

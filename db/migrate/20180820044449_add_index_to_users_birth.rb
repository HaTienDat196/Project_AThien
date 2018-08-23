# frozen_string_literal: true

class AddIndexToUsersBirth < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :birth, unique: true
  end
end

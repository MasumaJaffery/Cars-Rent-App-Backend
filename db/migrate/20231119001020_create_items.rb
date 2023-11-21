# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.string :city, null: false
      t.text :description, null: false
      t.string :image
      t.timestamps
    end
  end
end
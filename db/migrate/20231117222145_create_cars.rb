class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :added_by

      t.timestamps
    end
  end
end

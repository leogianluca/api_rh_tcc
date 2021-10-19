class CreateOccupations < ActiveRecord::Migration[6.1]
  def change
    create_table :occupations do |t|
      t.string :name
      t.string :salary
      t.references :department, null: false, foreign_key: true      
      t.timestamps
    end
  end
end

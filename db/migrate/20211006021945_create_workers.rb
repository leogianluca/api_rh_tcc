class CreateWorkers < ActiveRecord::Migration[6.1]
  def change
    create_table :workers do |t|
      t.string :document
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :identifier 
      t.references :occupation, null: false, foreign_key: true      
      t.timestamps
    end
  end
end

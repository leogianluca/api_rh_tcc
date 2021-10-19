class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.references :occupation, null: false, foreign_key: true      
      t.timestamps
    end
  end
end

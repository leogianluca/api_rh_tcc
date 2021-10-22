class CreateTimeSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :time_sheets do |t|
      t.string :status
      t.references :worker, null: false, foreign_key: true
      t.integer :time_worked
      t.string :comment
      t.json :datas, default: {}

      t.timestamps
    end
    add_column :workers, :daily_workload, :integer, default: 8
  end
end

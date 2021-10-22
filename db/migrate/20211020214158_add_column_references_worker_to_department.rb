class AddColumnReferencesWorkerToDepartment < ActiveRecord::Migration[6.1]
  def change
    add_reference :workers, :department, null: true, foreign_key: true
  end
end

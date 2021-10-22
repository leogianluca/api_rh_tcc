class AlterReferenceWorkerToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :workers, :user_id, :string
    add_reference :users, :worker, null: true, foreign_key: true
  end
end

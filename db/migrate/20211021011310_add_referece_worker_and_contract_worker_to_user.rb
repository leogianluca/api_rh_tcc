class AddRefereceWorkerAndContractWorkerToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :workers, :user, null: true, foreign_key: true
    add_reference :worker_legals, :user, null: true, foreign_key: true
  end
end

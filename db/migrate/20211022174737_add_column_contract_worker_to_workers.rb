class AddColumnContractWorkerToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_reference :workers, :contract_worker, foreign_key: true
  end
end

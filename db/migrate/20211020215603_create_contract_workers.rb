class CreateContractWorkers < ActiveRecord::Migration[6.1]
  def change
    create_table :contract_workers do |t|
      t.string :identifier 
      t.string :description
      t.string :estimated_hours
      t.timestamps
    end
  end
end

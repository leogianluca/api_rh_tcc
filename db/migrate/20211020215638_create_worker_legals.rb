class CreateWorkerLegals < ActiveRecord::Migration[6.1]
  def change
    create_table :worker_legals do |t|
      t.string :document
      t.string :full_name
      t.string :fantasy_name
      t.string :opening_cnpj
      t.references :role, null: false, foreign_key: true
      t.references :contract_worker, null: false, foreign_key: true
      t.timestamps
    end
  end
end

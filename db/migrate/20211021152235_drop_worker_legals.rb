class DropWorkerLegals < ActiveRecord::Migration[6.1]
  def change
    drop_table :worker_legals
  end
end

class AlterReferencesWorkersToRoles < ActiveRecord::Migration[6.1]
  def change
    remove_column :workers, :occupation_id
    add_reference :workers, :roles, null: false, foreign_key: true
  end
end

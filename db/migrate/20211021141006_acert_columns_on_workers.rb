class AcertColumnsOnWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :type, :string
    add_column :workers, :config, :json, default: {}
    remove_column :workers, :document, :string
    remove_column :workers, :first_name, :string
    remove_column :workers, :last_name, :string
    remove_column :workers, :birthday, :string
  end
end

class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :company_name
      t.string :trading_name
      t.string :document
      t.string :address
      t.string :number
      t.string :district
      t.string :complement
      t.string :cep
      t.string :city
      t.string :uf
      t.string :opening_hours
      t.timestamps
    end
  end
end

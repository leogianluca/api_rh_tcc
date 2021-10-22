module Worker
  class Base < ApplicationRecord
    self.table_name = "workers"

    belongs_to :role
    belongs_to :department, required: false
  end
end

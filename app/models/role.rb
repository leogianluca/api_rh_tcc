class Role < ApplicationRecord
  belongs_to :occupation

  validates_presence_of :name, :description
end

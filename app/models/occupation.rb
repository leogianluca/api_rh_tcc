class Occupation < ApplicationRecord
  belongs_to :department

  validates_presence_of :name, :salary
end

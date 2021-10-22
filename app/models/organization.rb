class Organization < ApplicationRecord
  validates_presence_of :company_name, :address, :cep, :number, :district, :city, :uf, :opening_hours

  validates :document, uniqueness: true
end

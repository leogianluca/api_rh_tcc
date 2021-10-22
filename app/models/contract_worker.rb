class ContractWorker < ApplicationRecord
  validates_presence_of :description, :estimated_hours

  before_save :set_identifier

  def set_identifier
    self.identifier = ("DWC-" << id.to_s(16).rjust(4, '0')).upcase
  end
end

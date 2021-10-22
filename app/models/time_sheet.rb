class TimeSheet < ApplicationRecord
  belongs_to :worker

  DEFAULT_TIMELINE = [
    { type: "initial_workload", status: "close", datetime: nil},
    { type: "initial_breakcoffe", status: "open", datetime: nil},
    { type: "return_breakcoffe", status: "open", datetime: nil},
    { type: "end_workload", status: "open", datetime: nil},
  ]

  store_accessor :datas, :timeline

  # <#time_line> -> [
  #   {
  #     type: "initial_workload" || "initial_breakcoffe" || "return_breakcoffe" || "end_workload",
  #     status: "open" || "close" || "allowance",
  #     datetime: DateTime.now
  #   }
  # ]

  after_initialize do
    if self.timeline.blank?
      self.timeline = DEFAULT_TIMELINE.clone
      t = self.timeline.find {|i| i[:type].eql? 'initial_workload' }
      t[:datetime] = DateTime.now
    end
  end
end

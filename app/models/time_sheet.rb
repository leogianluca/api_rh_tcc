class TimeSheet < ApplicationRecord
  belongs_to :worker

  # DEFAULT_TIMELINE = 

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
      self.timeline = [
        { type: "initial_workload", status: "close", datetime: DateTime.now},
        { type: "initial_breakcoffe", status: "open", datetime: nil},
        { type: "return_breakcoffe", status: "open", datetime: nil},
        { type: "end_workload", status: "open", datetime: nil},
      ]
    end
  end

  def checkpoint
    tl = self.timeline.find {|i| i[:status].eql? 'open' }
    puts tl
    if tl.present?
      tl[:status] = "close"
      tl[:datetime] = DateTime.now
    end
    self.save
  end

  def calculate
    iw, ib = self.timeline.find {|i| i[:type].eql? 'initial_workload' }[:datetime], self.timeline.find {|i| i[:type].eql? 'initial_breakcoffe' }[:datetime]
    rb, ew = self.timeline.find {|i| i[:type].eql? 'return_breakcoffe' }[:datetime], self.timeline.find {|i| i[:type].eql? 'end_workload' }[:datetime]

    r1 = ((ib - iw) * 24 * 60).to_f rescue nil
    r2 = ((ew - rb) * 24 * 60).to_f rescue nil
    puts "IW: #{iw || '-'}\nIB: #{ib || '-'}\nRB: #{rb}\nEW: #{ew}"
    puts "R1: #{r1 || '-'}\nR2: #{r2 || '-'}"
    self.time_worked = r1.round + r2.round if r1.present? && r2.present?
    sefl.save
  end
end

module Worker
  class Pj < Worker::Base
    belongs_to :contract_worker
    store :config, accessors: [:social_name, :opened_date], coder: JSON
  end
end
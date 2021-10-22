module Worker
  class Pf < Worker::Base
    store :config, accessors: [:full_name, :birthday], coder: JSON
  end
end
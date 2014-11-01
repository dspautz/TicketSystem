class ActiveRecord::Base
  cattr_accessor :skip_send_email, :skip_callbacks
end
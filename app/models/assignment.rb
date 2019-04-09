class Assignment < ApplicationRecord
  belongs_to :coder, foreign_key: :coder_id
  belongs_to :project
  # belongs_to :client, foreign_key: :client_id

end

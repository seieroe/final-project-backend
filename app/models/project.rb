class Project < ApplicationRecord
  has_many :assignments
  has_many :coders, through: :assignments
  belongs_to :client
  belongs_to :user, optional: true

end

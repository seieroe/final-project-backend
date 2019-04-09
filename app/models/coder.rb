class Coder < ApplicationRecord
  has_many :assignments
  has_many :projects, through: :assignments
  has_one_attached :photo

end

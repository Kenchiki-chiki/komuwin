class Correction < ApplicationRecord
  validates :content, presence: true
  belongs_to :document
  belongs_to :user
end

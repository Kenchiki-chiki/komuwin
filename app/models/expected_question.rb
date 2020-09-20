class ExpectedQuestion < ApplicationRecord
  validates :title, :content, presence: true
end

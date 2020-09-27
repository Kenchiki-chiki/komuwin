class Document < ApplicationRecord
  validates :title, :content, presence: true
  has_many :corrections
end

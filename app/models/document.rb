class Document < ApplicationRecord
  validates :title, :content, presence: true
end

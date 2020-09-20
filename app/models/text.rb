class Text < ApplicationRecord
  validates :title, :content, presence: true
end

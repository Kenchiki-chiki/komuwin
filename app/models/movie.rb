class Movie < ApplicationRecord
  validates :title, :url, presence: true
end

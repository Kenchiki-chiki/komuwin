class InterviewSheet < ApplicationRecord
  validates :title, :content, :genre, presence: true
end

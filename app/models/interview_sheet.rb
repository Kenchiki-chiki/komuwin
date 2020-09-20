class InterviewSheet < ApplicationRecord
  validates :title, :content, presence: true
end

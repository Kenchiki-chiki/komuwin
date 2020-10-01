class Document < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :corrections, dependent: :destroy
end

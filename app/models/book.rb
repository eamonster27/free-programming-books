class Book < ApplicationRecord
  validates :title, length: { minimum: 5 }
  validates :author, :title, :description, :url, presence: true
  belongs_to :user
end

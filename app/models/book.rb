class Book < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :author, presence: true
  validates :description, presence: true
  validates :url, presence: true
end

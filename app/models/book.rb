class Book < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }
            :author, presence: true,
            :description, presence: true,
            :url, presence: true
end

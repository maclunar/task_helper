class Task < ApplicationRecord
  validates :number, presence: true
  validates :title, presence: true, length: { minimum: 3 }
end

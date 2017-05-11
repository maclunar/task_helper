class Task < ApplicationRecord
  has_many :steps, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3 }

  def is_finished?
    steps_remaining == 0
  end

  def steps_remaining
    steps.where(finished: false).count
  end

end

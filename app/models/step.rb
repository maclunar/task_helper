class Step < ApplicationRecord
  belongs_to :task

  def to_s
    title.to_s
  end

  def finish!
    update_column(:finished, true)
  end

  def unfinish!
    update_column(:finished, false)
  end

end

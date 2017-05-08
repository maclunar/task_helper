class Step < ApplicationRecord
  belongs_to :task

  def to_s
    ( finished? ? '✓' : '✗' ) + '  ' + title.to_s
  end

end

class Task < ApplicationRecord
  BACKEND_PRESETS = ['request specs',
                     'check if PR is approved',
                     'check if circleCI passed',
                     'merge to staging',
                     'test on staging',
                     'sync OneSky',
                     'merge to master',
                     'run deploy on production',
                     "move card to 'On Production'"]
  FRONTEND_PRESETS = ['request specs',
                     'check if PR is approved',
                     'check if circleCI passed',
                     'test via rev_key on web',
                     'test via rev_key on mobile',
                     'merge to staging',
                     'test on staging',
                     'sync OneSky',
                     'merge to master',
                     'test on master with rev_key',
                     'activate revision',
                     "move card to 'On Production'"]

  has_many :steps, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3 }

  def is_finished?
    steps_remaining == 0
  end

  def status
    is_finished? ? '✓' : '✗'
  end

  def steps_remaining
    steps.where(finished: false).count
  end

  def add_preset_steps(preset)
    case preset
    when 'backend'
      BACKEND_PRESETS.each do |preset|
        self.steps.create(title: preset.to_s, finished: false)
      end
    when 'frontend'
      FRONTEND_PRESETS.each do |preset|
        self.steps.create(title: preset.to_s, finished: false)
      end
    end
  end

end

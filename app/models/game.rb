class Game < ApplicationRecord
  has_many :play_sessions

  # add_flash_type :congratulation

  validates :title, presence: true, uniqueness: true
  validates :instructions, presence: true
  validates :video, presence: true
  # Only difficulties:
  validates :difficulty, presence: true, inclusion:
    {
      in: %w[easy medium hard]
    }

  def current_repetition(user)
    play_sessions.where(user: user).count
  end

  def repetition_streak(user)
    count = current_repetition(user)
    if count <= 5
      return "5"
    elsif count <= 10
      return "10"
    elsif count <= 15
      return "15"
    end
  end
end

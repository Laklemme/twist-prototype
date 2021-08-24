class Game < ApplicationRecord
  has_many :play_sessions

  validates :title, presence: true, uniqueness: true
  validates :instructions, presence: true
  validates :video, presence: true
  # Only difficulties:
  validates :difficulty, presence: true, inclusion:
    {
      in: %w[easy medium hard]
    }
end

class User < ApplicationRecord
  # gem to track streaks
  include Streakable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :play_sessions
  before_save :set_balance
  def set_balance
    self.balance = balance.nil? ? 0 : balance
  end
end

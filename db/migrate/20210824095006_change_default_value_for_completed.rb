class ChangeDefaultValueForCompleted < ActiveRecord::Migration[6.0]
  # Forgot to give :completed a default value
  # Migration to add default value: false
  def change
    change_column_default :play_sessions, :completed, from: nil, to: false
  end
end

class CreatePlaySessions < ActiveRecord::Migration[6.0]
  def change
    create_table :play_sessions do |t|
      t.time :time
      t.date :date
      t.boolean :completed
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

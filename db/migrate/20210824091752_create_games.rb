class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.text :instructions
      t.string :video
      t.string :title
      t.string :difficulty

      t.timestamps
    end
  end
end

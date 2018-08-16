class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :album_id, null: false 
      t.integer :ord, null: false
      t.boolean :regular, null: false, default: true
      t.text :lyrics
      t.timestamps
    end
  end
end

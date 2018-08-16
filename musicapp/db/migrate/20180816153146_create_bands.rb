class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name, NULL:false
      t.timestamps
    end
    add_index :bands, :name, unique: true 
  end
end

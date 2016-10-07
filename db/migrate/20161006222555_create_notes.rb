class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note, null: false
      t.integer :author_id, null: false
      t.integer :track_id, null: false
      t.timestamps null: false
    end
  end
end

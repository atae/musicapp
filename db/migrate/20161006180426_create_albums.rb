class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.boolean :live?, null: false
      t.string :title, null: false
      
      t.timestamps null: false
    end
  end
end

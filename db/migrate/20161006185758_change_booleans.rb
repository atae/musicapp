class ChangeBooleans < ActiveRecord::Migration
  def change
    change_column :albums, :live?, :string
    change_column :tracks, :bonus?, :string
  end
end

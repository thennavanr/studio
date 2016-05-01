class CreateAlbumStats < ActiveRecord::Migration
  def change
    create_table :album_stats do |t|
      t.string :album
      t.integer :views
      t.integer :likes
      t.string :caption
      t.string :tags

      t.timestamps null: false
    end
  end
end

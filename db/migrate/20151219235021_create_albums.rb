class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :user
      t.string :password
      t.string :album_name
      t.boolean :secured
      t.datetime :created_date

      t.timestamps null: false
    end
  end
end

class AddOrderToAlbumStats < ActiveRecord::Migration
  def change
    add_column :album_stats, :order, :integer
  end
end

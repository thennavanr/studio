class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :album
      t.string :password

      t.timestamps null: false
    end
  end
end

class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :genre, null: false, foreign_key: true
      t.string :title
      t.string :album
      t.string :description
      t.text :lyrics

      t.timestamps
    end
  end
end

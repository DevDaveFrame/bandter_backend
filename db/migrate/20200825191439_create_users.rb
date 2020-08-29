class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :location
      t.string :bio
      t.string :img_url
      t.string :seeking
      t.integer :search_radius

      t.timestamps
    end
  end
end

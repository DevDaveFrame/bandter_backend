class CreateMatchChats < ActiveRecord::Migration[6.0]
  def change
    create_table :match_chats do |t|
      t.integer :friender_id
      t.integer :friendee_id
      t.boolean :accepted

      t.timestamps
    end
  end
end

class CreateUserInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :user_instruments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :instrument, null: false, foreign_key: true
      t.string :style

      t.timestamps
    end
  end
end

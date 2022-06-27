class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :confirmation, null: false
      t.references :flight, null: false, type: :bigint, index: true, foreign_key: true
    end
    add_index :bookings, :confirmation, unique: true
  end
end

class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :duration, null: false
      t.references :origin, null: false, foreign_key: { to_table: :airports }
      t.references :destination, null: false, foreign_key: { to_table: :airports }
      t.date :date, null: false
      t.time :time, null: false
      t.integer :flight_number, null: false

    end
  end
end

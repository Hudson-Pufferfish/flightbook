class CreatePassengerBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :passenger_bookings, id: false do |t|
      t.references :passenger, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

    end
  end
end

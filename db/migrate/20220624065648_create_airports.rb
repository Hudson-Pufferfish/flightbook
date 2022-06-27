class CreateAirports < ActiveRecord::Migration[6.1]
  def change
    create_table :airports do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.string :city, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :airports, :code, unique: true
  end
end

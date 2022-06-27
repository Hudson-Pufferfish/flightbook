class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|

      t.datetime :created_at
      t.datetime :updated_at
      t.string :name, null: false
      t.string :email, null: false
    end
    add_index :passengers, :email, unique: true
  end
end

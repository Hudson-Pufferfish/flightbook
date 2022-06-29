class RemoveIndexFromPassengers < ActiveRecord::Migration[6.1]
  def change
    remove_index :passengers, :email
  end
end

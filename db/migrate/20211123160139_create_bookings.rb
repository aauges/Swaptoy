class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    # maybe this is for quotas
    create_table :bookings do |t|

      t.date :start_date
      t.date :end_date
      t.integer :total_slots
      t.string :subscription_type

      t.references :user, foreign_key: true
      t.references :toy, foreign_key: true

      t.timestamps
    end
  end
end

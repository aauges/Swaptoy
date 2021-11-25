class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    # maybe this is for quotas
    create_table :bookings do |t|
      t.boolean :return_status

      t.references :toy, foreign_key: true
      t.references :monthly_subscription, foreign_key: true

      t.timestamps
    end
  end
end

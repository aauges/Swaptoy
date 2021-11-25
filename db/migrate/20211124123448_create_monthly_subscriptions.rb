class CreateMonthlySubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :monthly_subscriptions do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :return_status
      t.integer :total_slot
      t.boolean :sub_model
      t.boolean :confirmed

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

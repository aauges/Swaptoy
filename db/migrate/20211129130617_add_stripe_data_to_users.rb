class AddStripeDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :stripe_subscription_id, :string
    add_column :users, :checkout_session_id, :string
    add_column :users, :stripe_customer_id, :string
  end
end

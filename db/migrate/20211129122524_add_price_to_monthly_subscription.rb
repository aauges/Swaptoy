class AddPriceToMonthlySubscription < ActiveRecord::Migration[6.0]
  def change
    add_monetize :monthly_subscriptions, :price, currency: { present: false }
  end
end

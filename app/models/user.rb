class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :monthly_subscriptions
  has_many :bookings, through: :monthly_subscription
  has_many :reviews, through: :bookings

  def update_subscription(session_id)
    subscription_data = Stripe::Checkout::Session.retrieve(session_id)
    self.stripe_subscription_id = subscription_data.subscription
    self.stripe_customer_id = subscription_data.customer
    save
  end

  def stripe_subscription
    Stripe::Subscription.retrieve(stripe_subscription_id)
  end

  def subscribed?
    stripe_subscription_id?
  end

  def has_active_subscription?
    subscription = Subscription.find_by(user: id, status: "active")
    subscription.present?
  end
end

class Subscription < ApplicationRecord
  validates :name, :email, presence: true, length: { minimum: 4 }
  validates :email, format: { with: /.+@.+\..+/i, message: "needs to be a valid email address" }

  after_create :notify_admin

  def notify_admin
    AdminMailer.new_subscription(self).deliver_later
  end

  def to
    ['reservations@tistorage.com', 'sales@tistorage.com']
  end
end

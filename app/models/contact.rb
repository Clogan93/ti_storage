class Contact < ApplicationRecord
  store_accessor :data, :site, :marketing_channel, :message

  validates :name, :email, :phone, presence: true

  after_create :notify_admin

  def notify_admin
    AdminMailer.new_contact(self).deliver_later
  end

  def to
    if is_customer?
      ["gt@ceqy.com", "jcoakley@ceqy.com", "reservations@tistorage.com"]
    else
      ["sales@tistorage.com"]
    end
  end

  def subject
    kind = is_customer? ? "Current" : "New"
    "#{kind} customer wants to contact you"
  end
end

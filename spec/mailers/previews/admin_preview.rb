# frozen_string_literal: true
# Preview all emails at http://localhost:3000/rails/mailers/admin
class AdminPreview < ActionMailer::Preview
  def new_subscription
    AdminMailer.new_subscription(subscription)
  end

  def new_contact_from_new_customer
    AdminMailer.new_contact(new_customer)
  end

  def new_contact_from_old_customer
    AdminMailer.new_contact(old_customer)
  end

  private

  def subscription
    OpenStruct.new(
      email: "demo@example.com",
      name: "John Doe"
    )
  end

  def new_customer
    OpenStruct.new(
      to: ['new_customer@tistorage.com'],
      subject: 'New Customer Subject',
      email: "new_customer@email.com",
      name: "New Customer",
      phone: "1231231234",
      marketing_channel: "Radio",
      message: "Fooey"
    )
  end

  def old_customer
    OpenStruct.new(
      to: ['old_customer@tistorage.com'],
      subject: 'Old Customer Subject',
      email: "old_customer@email.com",
      name: "Old Customer",
      phone: "1231231234",
      site: "Jamaica",
      message: "Fooey"
    )
  end
end

# frozen_string_literal: true
# Preview all emails at http://localhost:3000/rails/mailers/cart
class CartPreview < ActionMailer::Preview
  def cart_confirmation
    CartMailer.cart_confirmation(cart)
  end

  def cart_alert
    CartMailer.cart_alert(cart)
  end

  private

  def cart
    @cart ||= OpenStruct.new(
      email: "demo@example.com",
      name: "John Doe",
      move_in_date: 7.days.from_now.to_date,
      account: account,
      site: site,
      unit: unit
    )
  end

  def account
    @account ||= OpenStruct.new(
      name: "Tom Murphy",
      email: "tom@gmail.com",
      address: address,
      phone: phone
    )
  end

  def site
    @site ||= Site::SITES.first
  end

  def unit
    @unit ||= site.units.execute.last
  end

  def address
    @address ||= OpenStruct.new(
      address_1: "123 4th St.",
      city: "Brooklyn",
      state: "NY",
      postal_code: "12345"
    )
  end

  def phone
    @phone ||= OpenStruct.new(
      phone: "7181231234"
    )
  end
end

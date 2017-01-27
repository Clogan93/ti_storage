module Admin
  class CartPresenter < BasePresenter
    def payment
      Admin::PaymentDataPresenter.new(OpenStruct.new(JSON.parse(@model.payment_data)), h)
    end
  end
end

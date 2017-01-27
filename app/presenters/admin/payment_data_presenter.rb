module Admin
  class PaymentDataPresenter < BasePresenter
    def transaction_id
      @model.tran_id
    end
  end
end

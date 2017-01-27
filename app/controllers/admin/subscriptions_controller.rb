module Admin
  class SubscriptionsController < AdminController
    def index
      @subscriptions = Subscription.order(id: :desc).all
    end
  end
end

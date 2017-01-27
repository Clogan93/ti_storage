module Admin
  class CartsController < AdminController
    def index
      @carts = Cart.all
    end

    def show
      @cart = Cart.find(params.fetch(:id))
    end
  end
end

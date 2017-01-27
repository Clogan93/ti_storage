module Admin
  class CartsController < AdminController
    def index
      @carts = Cart.all
    end

    def show
      @cart = Admin::CartPresenter.new(Cart.find(params.fetch(:id)), view_context)
    end
  end
end

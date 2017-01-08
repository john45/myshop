class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_all_category
  
  private
    def current_cart
      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        session[:count_of_products] = 0
        cart
    end

    def find_all_category
      @category = Category.all
    end
end

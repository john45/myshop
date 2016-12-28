class ProductsController < ApplicationController
  before_action :find_all_category, except: :add_to_cart
  def index
    @products = Product.paginate(page: params[:page], per_page: 9)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    product_id = params[:id]
    if cookies[:cart].present?
      product = cookies[:cart].split(',')
      product << product_id
      cookies[:cart] = product.join(',')
    else
      cookies[:cart] = product_id
    end
    redirect_to :back
  end

  private
    def find_all_category
      @category = Category.all
    end
end

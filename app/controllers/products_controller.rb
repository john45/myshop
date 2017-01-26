class ProductsController < ApplicationController
  before_action :last_added_products, except: :add_to_cart
  def index

    @products = if params[:category]
      categories = Category.find(params[:category]).subtree_ids
      Product.where(category: categories)
    elsif params[:search]
      Product.where("name ILIKE ?", "%#{params[:search]}%")
    else
      Product.all
    end.paginate(page: params[:page], per_page: 9)

    @product_for_carusel = Product.all.sample(5)
    render :index
  end

  def show
    @review = Review.new
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
    redirect_back fallback_location: {action: 'show', id: product_id}
  end

  private
    def last_added_products
      @last_added_products = Product.order(created_at: :desc).limit(3)
    end
end

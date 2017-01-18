class ProductsController < ApplicationController
  before_action :last_added_products, except: :add_to_cart
  def index

    if params[:category]
      categories = Category.find(params[:category]).subtree_ids
      @products = Product.where(category: categories).paginate(page: params[:page], per_page: 9)

      # categories.each do |category|
      #   @products.nil? ? @products = Product.where(category: category).paginate(page: params[:page], per_page: 9) : @products.merge(Product.where(category: category)).paginate(page: params[:page], per_page: 9)
      # end
      # Product.where(category_id: params[:category]).paginate(page: params[:page], per_page: 9)
    elsif params[:search]
      @products = Product.where("name ILIKE ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 9)
    else
      @products = Product.paginate(page: params[:page], per_page: 9)
    end
    @product_for_carusel = Product.all.sample(5)
    render :show
  end

  def show
    @review = Review.new
    @product = Product.find(params[:id])
    # @fea_value = {}
    # @product.feature_values.each do |feature_value|
    #   @fea_value[feature_value.feature.title] = feature_value.title
    # end

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

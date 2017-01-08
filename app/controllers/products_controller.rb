class ProductsController < ApplicationController
  before_action :find_all_category, except: :add_to_cart
  before_action :last_added_products, except: :add_to_cart
  def index
    @products = if params[:category]
                  Product.where(category_id: params[:category]).paginate(page: params[:page], per_page: 9)
                elsif params[:search]
                  Product.where("name ILIKE ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 9)
                else
                  Product.paginate(page: params[:page], per_page: 9)
                end
  end

  def show
    @product = Product.find(params[:id])
    @fea_value = {}
    @product.feature_values.each do |feature_value|
      @fea_value[feature_value.feature.title] = feature_value.title
    end

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
    def find_all_category
      @category = Category.all
    end

    def last_added_products
      @last_added_products = Product.order(created_at: :desc).limit(3)
    end
end

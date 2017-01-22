module ProductsHelper
  def image_url_for_img_tag(width=800, high=300)
    image_url("http://lorempixel.com/#{width}/#{high}/#{%w(technics transport business city nature).sample}")
  end
end

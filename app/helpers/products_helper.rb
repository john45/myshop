module ProductsHelper
  def image_url_for_karusel
    image_url("http://lorempixel.com/800/300/#{['technics',
                                                'transport',
                                                'business',
                                                'city',
                                                'nature'].sample}")
  end
end

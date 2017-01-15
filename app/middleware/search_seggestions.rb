class SearchSeggestion
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] = "/search_seggestions"
      request = Rack::Request.new(env)
      terms = SearchSeggestion.term_for(request.params["term"])
      [200, {"Content-T ype" => "application/json"}, [terms.to_json]]
    else
      @app.call(env)
    end
  end

end
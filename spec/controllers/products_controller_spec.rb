require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET index" do
  #   it "assigns @product" do
  #     get :index
  #     expect(assigns(@product)).to eq([@product])
  #   end

    it "Render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end

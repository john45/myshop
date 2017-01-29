require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET page" do
    context "true page" do
      it "Render the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end
end

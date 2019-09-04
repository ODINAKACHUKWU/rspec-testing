$LOAD_PATH.unshift("json-api/app/controllers/v2")
require "articles_controller"
# require "rails_helper"

describe V2::ArticlesController do
  describe "GET #show" do
    def trigger
      get :show, id: article.id
    end

    let(:article) {
      Article.create(title: "Hello world!")
    }

    it "returns http success" do
      trigger
      expect(response).to have_http_status(:success)
    end
  end
end

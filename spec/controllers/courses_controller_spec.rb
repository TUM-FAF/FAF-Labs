require "spec_helper"

describe CoursesController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.code).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the courses into @courses" do
      course = Course.create!
      get :index

      expect(assigns(:courses)).to match_array([course])
    end
  end
end

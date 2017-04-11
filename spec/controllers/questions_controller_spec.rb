require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #quizz" do
    it "returns http success" do
      get :quizz
      expect(response).to have_http_status(:success)
    end
  end

end

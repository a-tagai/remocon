require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      skip 'TODO:後で確認'
      expect(response).to have_http_status(:success)
    end
  end

end

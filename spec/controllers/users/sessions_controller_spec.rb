require 'rails_helper'

RSpec.describe Users::SessionsController, :type => :controller do
  describe 'GET sessions/#new' do
    login_user
    it "should have a current_user" do
      skip 'TODO:後で実装'
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(controller.current_user).to_not eq(nil)
    end
  end
end

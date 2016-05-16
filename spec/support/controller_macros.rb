#devise用の共通モジュール
module ControllerMacros
  def login_user
    before(:each) do
      user = FactoryGirl.create(:ichiro)
      user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end
end
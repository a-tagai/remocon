require 'rails_helper'

RSpec.describe Users::SessionsController, :type => :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'GET sessions/#new' do
    context '一般ユーザーでのログイン状態の場合' do
      login_user
      before(:each) do
        get :new
      end

      example "current_userでログインユーザー情報が取得できること" do
        expect(controller.current_user).to_not eq(nil)
      end

      example "ルートページへリダイレクトされること" do
        expect(response).to redirect_to(root_path)
      end
    end

    context '未ログイン状態の場合' do
      before(:each) do
        skip 'Devise.mappings[:user]を指定して良いのか後で調べる'
        get :new
      end

      example "current_userでログインユーザー情報が取得できないこと" do
        expect(controller.current_user).to eq(nil)
      end

      example ":newテンプレートがレンダリングされていること" do
        expect(response).to render_template :new
      end
    end
  end
end

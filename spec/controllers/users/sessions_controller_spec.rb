require 'rails_helper'

RSpec.describe Users::SessionsController, :type => :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'GET sessions/#new' do
    context 'ログイン状態の場合' do
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

  describe 'POST sessions/#create' do
    context 'ログイン状態の場合' do
      login_user
      example "ルートページへリダイレクトされること" do
        post :create
        expect(response).to redirect_to(root_path)
      end
    end

    context '未ログイン状態の場合' do
      example "ログイン状態になること" do
        post :create
        expect(user_signed_in?).to
      end
    end
  end
end

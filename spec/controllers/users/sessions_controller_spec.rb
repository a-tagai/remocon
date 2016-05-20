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
        expect(subject.current_user).to_not eq(nil)
      end

      example "ルートページへリダイレクトされること" do
        expect(response).to redirect_to(root_path)
      end
    end

    context '未ログイン状態の場合' do
      before do
        get :new
      end

      example "current_userでログインユーザー情報が取得できないこと" do
        expect(subject.current_user).to eq(nil)
      end

      example ":newテンプレートがレンダリングされていること" do
        expect(response).to render_template :new
      end
    end
  end

  describe 'POST sessions/#create' do
    before do
      #ユーザーアカウントの作成
      FactoryGirl.create(:ichiro).confirm!
    end

    context 'ログイン状態の場合' do
      login_user
      example "ルートページへリダイレクトされること" do
        post :create
        expect(response).to redirect_to(root_path)
      end
    end

    context '未ログイン状態の場合' do
      context '存在するアカウントでログインを行う場合' do
        example "ログインに成功すること" do
          post :create, user: FactoryGirl.attributes_for(:ichiro)
          expect(subject.user_signed_in?).to eq(true)
        end
      end
      context '存在しないアカウントでログインを行う場合' do
        example "ログインに失敗すること" do
          post :create, user: FactoryGirl.attributes_for(:jiro)
          expect(subject.user_signed_in?).to_not eq(true)
        end
      end
    end
  end
end

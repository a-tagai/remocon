require 'rails_helper'

RSpec.describe Users::SessionsController, :type => :controller do
  #ユーザーアカウントの作成
  let!(:user){
    user = FactoryGirl.create(:user)
    user.skip_confirmation!
    user.save
    user
  }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'GET sessions/#new' do
    context 'ログイン状態の場合' do
      before do
        sign_in user
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

    context 'ログイン状態の場合' do
      before do
        sign_in user
      end
      example "ルートページへリダイレクトされること" do
        post :create
        expect(response).to redirect_to(root_path)
      end
    end

    context '未ログイン状態の場合' do
      context '存在するアカウントでログインを行う場合' do
        example "ログインに成功すること" do
          post :create, user: FactoryGirl.attributes_for(:user)
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

require 'rails_helper'

feature 'Users', :type => :feature do
  feature "new_user_session_pathページ" do
    #ユーザーアカウントの作成
    let!(:user){
      user = FactoryGirl.create(:user)
      user.skip_confirmation!
      user.save
      user
    }

    context 'ログインしていない場合' do
      before do
        visit new_user_session_path
      end

      scenario '既存アカウントでログインが可能であること' do
        fill_in 'Email', with: 'example@example.com'
        fill_in 'Password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end

      scenario '存在しないアカウントでログインが失敗すること' do
        fill_in 'Email', with: 'unknown@example.com'
        fill_in 'Password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'メールアドレスまたはパスワードが無効です。'
      end
    end
  end

end

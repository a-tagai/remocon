require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'Validation' do
    before :each do
      @ichiro = FactoryGirl.create(:ichiro)
      @jiro = FactoryGirl.create(:jiro)
    end

    describe '#email' do
      context '全角スペースのみの場合' do
        example "バリデートエラーになること" do
          @ichiro.email = '　'
          @ichiro.save
          expect(@ichiro).to_not be_valid
        end
      end

      context '半角スペースのみの場合' do
        example "バリデートエラーになること" do
          @ichiro.email = ' '
          @ichiro.save
          expect(@ichiro).to_not be_valid
        end
      end

      context '空の場合' do
        example "バリデートエラーになること" do
          @ichiro.email = ''
          @ichiro.save
          expect(@ichiro).to_not be_valid
        end
      end

      context 'メールドメインが含まれてない文字列の場合' do
        example "バリデートエラーになること" do
          @ichiro.email = 'example100'
          @ichiro.save
          expect(@ichiro).to_not be_valid
        end
      end

      context '誤ったフォーマットの場合' do
        valid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
        valid_addresses.each do |valid_address|
          context '「' + valid_address + '」の場合' do
            example "バリデートエラーになること" do
              @ichiro.email = valid_address
              @ichiro.save
              expect(@ichiro).to_not be_valid
            end
          end
        end
      end

      context '既に登録済みのメールアドレスを指定した場合' do
        example "バリデートエラーになること" do
          @ichiro.email = "example@example.com"
          @ichiro.save
          @jiro.email = "example@example.com"
          @jiro.save
          expect(@jiro).to_not be_valid
        end
      end
    end

    describe '#password' do
      context 'パスワードが5文字の場合' do
        example "バリデートエラーになること" do
          @ichiro.password = "12345"
          @ichiro.save
          expect(@ichiro).to_not be_valid
        end
      end
      context 'パスワードが6文字の場合' do
        example "バリデートに通過すること" do
          @ichiro.password = "123456"
          @ichiro.save
          expect(@ichiro).to be_valid
        end
      end

    end

  end
end

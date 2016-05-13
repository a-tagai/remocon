require 'rails_helper'

RSpec.describe User, :type => :model do

  describe '#create' do
    before :each do
      @ichiro = User.create(
        email: 'example@example.com',
        password: '000000'
      )
    end

    context 'テストデータが初期値の場合' do
      example "バリデートに通過すること" do
        expect(@ichiro).to be_valid
      end
    end

    describe 'emailフィールド' do
      context '全角スペースのみの場合' do
        example "バリデートエラーになること" do
          @ichiro.email = '　'
          expect(@ichiro).to_not be_valid
        end
      end

      context '半角スペースのみの場合' do
        example "バリデートエラーになること" do
          @ichiro.email = ' '
          expect(@ichiro).to_not be_valid
        end
      end

      context '空の場合' do
        example "バリデートエラーになること" do
          @ichiro.email = ''
          expect(@ichiro).to_not be_valid
        end
      end

      context 'メールドメインが含まれてない文字列の場合' do
        example "バリデートエラーになること" do
          @ichiro.email = 'example100'
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
              expect(@ichiro).to_not be_valid
            end
          end
        end
      end

    end
  end
end

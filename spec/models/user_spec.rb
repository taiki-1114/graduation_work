require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'バリデーションチェック' do
      it '設定した全てのバリデーションが機能しているか' do
        user = User.create(email: "user@example.com", password: "password")
        expect(user).to be_valid
        expect(user).to be_empty
      end
    end
end

RSpec.describe Article, type: :model do
  describe 'バリデーションチェック' do
    it '設定した全てのバリデーションが機能しているか' do
      article = Article.create
    end
  end
end
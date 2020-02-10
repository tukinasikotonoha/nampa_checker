require 'rails_helper'

RSpec.describe User, type: :model do
	context "メールアドレスが重複したユーザーが作成されようとした時" do
		it "エラーになる" do
			create(:user, email: "user@example.com")
      user = build(:user, email: "user@example.com")
			user.valid?
			expect(user.errors.messages[:email]).to include "はすでに存在します"
    end
  end

end

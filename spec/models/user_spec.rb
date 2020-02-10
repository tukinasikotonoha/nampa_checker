require 'rails_helper'

RSpec.describe User, type: :model do
	context "メールアドレスが重複したユーザーが作成されようとした時" do
		let!(:already_user) { create :user, :email_duplication }
		it "エラーになる" do
			user = User.new(email: "user@example.com", name: "ことのは", password: "password", password_confirmation: "password")
			user.valid?
			expect(user.errors.messages[:email]).to include "はすでに存在します"
    end
  end

end

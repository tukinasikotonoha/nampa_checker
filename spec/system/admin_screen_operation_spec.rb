require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  let(:user) { create :user }
  let(:admin_user) { create :user, :admin }
  before do
    admin_user
    visit admin_login_path
    fill_in 'email', with: admin_user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'
  end
  describe '管理画面' do
    context 'ユーザー一覧からユーザーを削除' do
      it '管理画面のTOPにリダイレクトされて「ログインしました」とフラッシュメッセージが表示される', js: true do
        user
        within ".sidebar" do
          click_on 'ユーザー一覧'
        end
        within "#user-#{user.id}" do
          click_on '削除'
        end
        page.driver.browser.switch_to.alert.accept
        expect(current_path).to eq admin_users_path
        expect(page).to have_content 'ユーザーを削除しました'
        # binding.pry
      end
    end
  end
end

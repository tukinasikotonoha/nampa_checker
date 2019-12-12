require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  let(:user) { create :user }
  let(:admin_user) { create :user, :admin }
  describe '管理画面' do
    context '管理者権限を持たないユーザーで管理画面にアクセス' do
      it 'トップページにリダイレクトされて「権限がありません」とフラッシュメッセージが表示される' do
        visit "/login_as/#{user.id}"
        visit admin_path
        expect(current_path).to eq root_path
        expect(page).to have_content '権限がありません'
      end
    end

    context 'ログインしてない状態で管理画面にアクセス' do
      it '管理者ログイン画面にリダイレクトされて「ログインしてください」とフラッシュメッセージが表示される' do
        visit admin_path
        expect(current_path).to eq admin_login_path
        expect(page).to have_content 'ログインしてください'
      end
    end

    context '管理者権限を持つユーザーで管理画面にログイン' do
      it '管理画面のTOPにリダイレクトされて「ログインしました」とフラッシュメッセージが表示される' do
        admin_user
        visit admin_login_path
        fill_in 'email', with: admin_user.email
        fill_in 'password', with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq admin_path
        expect(page).to have_content 'ログインしました'
      end
    end
  end
end

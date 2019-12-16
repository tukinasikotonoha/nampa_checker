require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  let(:user) { create :user }
  describe 'トップページ' do
    context 'フッターの「利用規約」リンクをクリック' do
      it '遷移先のcurrent_pathが利用規約ページなのか検証' do
        visit "/login_as/#{user.id}"
        visit root_path
        within '.footer' do
          click_on '利用規約'
        end
        expect(current_path).to eq term_path
      end
    end

    context 'フッターの「プライバシーポリシー」リンクをクリック' do
      it '遷移先のcurrent_pathがプライバシーポリシーページなのか検証' do
        visit "/login_as/#{user.id}"
        visit root_path
        within '.footer' do
          click_on 'プライバシーポリシー'
        end
        expect(current_path).to eq privacy_path
      end
    end
  end
end

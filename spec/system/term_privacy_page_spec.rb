require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  let(:user) { create :user }
  describe 'トップページ' do
    context 'フッターの「利用規約」リンクをクリック' do
      it '遷移先のcurrent_pathが利用機ページなのか検証' do
        visit "/login_as/#{user.id}"
        visit root_path
        within '.footer' do
          click_on '利用規約'
        end
        binding.pry
        expect(current_path).to eq page_path('term')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'Results', type: :system do
  let(:user) { create :user }
  before do
    visit "/login_as/#{user.id}"
  end
  describe 'TOPページ' do
    context '10メガバイトを超える画像を添付してアップロード' do
      it '「画像のファイルサイズは10メガバイト以下でお願いします」とフラッシュメッセージが表示される' do
        binding.pry
        visit root_path
      end
    end
  end
end

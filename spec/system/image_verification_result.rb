require 'rails_helper'

RSpec.describe 'Results', type: :system do
  let(:user) { create :user }
  before do
    visit "/login_as/#{user.id}"
  end
  describe 'TOPページ' do
    context '10メガバイトを超える画像を添付してアップロード' do
      it '「画像のファイルサイズは10メガバイト以下でお願いします」とフラッシュメッセージが表示される' do
        attach_file 'result[image]', "#{Rails.root}/spec/system/images/images_over_10_megabytes.jpg"
        click_button '女性に見える確率を検証'
        expect(page).to have_content '画像のファイルサイズは10メガバイト以下でお願いします'
      end
    end
  end
end

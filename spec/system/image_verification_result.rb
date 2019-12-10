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

    context 'bmp形式の画像をアップロード' do
      it '「画像の拡張子はjpg/jpeg/gif/pngのみアップロード可能です」とフラッシュメッセージが表示される' do
        attach_file 'result[image]', "#{Rails.root}/spec/system/images/svg_icon.svg"
        click_button '女性に見える確率を検証'
        expect(page).to have_content '画像の拡張子はjpg/jpeg/gif/pngのみアップロード可能です'
      end
    end

    context '性別が判定できない画像をアップロード' do
      it '「画像の性別を判定できませんでした」とフラッシュメッセージが表示される' do
        attach_file 'result[image]', "#{Rails.root}/spec/system/images/no_gender.png"
        click_button '女性に見える確率を検証'
        expect(page).to have_content '画像の性別を判定できませんでした'
      end
    end

    context '女性である確率が「95.78%」の画像をアップロード' do
      it '検証結果の画面に遷移し、画面内に「95.78」が存在することを検証' do
        attach_file 'result[image]', "#{Rails.root}/spec/system/images/female1.jpg"
        click_button '女性に見える確率を検証'
        expect(page).to have_selector '.gender-rate', text: '95.78'
        expect(current_path).to eq result_path(user.results.first.uuid)
      end
    end

    context '女性である確率が「0.6%」の画像をアップロード' do
      it '検証結果の画面に遷移し、画面内に「0.6」が存在することを検証' do
        attach_file 'result[image]', "#{Rails.root}/spec/system/images/male1.jpg"
        click_button '女性に見える確率を検証'
        expect(current_path).to eq result_path(user.results.first.uuid)
      end
    end

    context '画像の検証に成功した後にマイページに移動' do
      it 'マイページ内に検証結果のresult-idを持つdivタグが存在することを検証する' do
        attach_file 'result[image]', "#{Rails.root}/spec/system/images/female1.jpg"
        click_button '女性に見える確率を検証'
        within('#navmenu1') do
          click_on 'マイページ'
        end
        expect(page).to have_selector "#result-#{user.results.first.id}"
      end
    end

    context '画像の検証に成功した後にマイページから検証画像を削除' do
      it 'マイページ内に検証結果のresult-idを持つdivタグが存在しないことを検証する' do
        attach_file 'result[image]', "#{Rails.root}/spec/system/images/female1.jpg"
        click_button '女性に見える確率を検証'
        within('#navmenu1') do
          click_on 'マイページ'
        end
        within "#result-#{user.results.first.id}" do
          click_on '削除'
        end
        page.driver.browser.switch_to.alert.accept
        expect(page).to_not have_selector "#result-#{user.results.first.id}"
      end
    end
  end
end
